// To parse this JSON data, do
//
//     final iklanBuyer = iklanBuyerFromJson(jsonString);

import 'dart:convert';

IklanBuyer iklanBuyerFromJson(String str) => IklanBuyer.fromJson(json.decode(str));

String iklanBuyerToJson(IklanBuyer data) => json.encode(data.toJson());

class IklanBuyer {
    IklanBuyer({
        required this.data,
        required this.message,
        required this.statusCode,
    });

    List<IklanBuyerData> data;
    String message;
    int statusCode;

    factory IklanBuyer.fromJson(Map<String, dynamic> json) => IklanBuyer(
        data: List<IklanBuyerData>.from(json["data"].map((x) => IklanBuyerData.fromJson(x))),
        message: json["message"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status_code": statusCode,
    };
}

class IklanBuyerData {
    IklanBuyerData({
        required this.endDate,
        required this.id,
        required this.ongoingWeight,
        required this.requestedWeight,
        required this.title,
    });

    String endDate;
    String id;
    int ongoingWeight;
    int requestedWeight;
    String title;

    factory IklanBuyerData.fromJson(Map<String, dynamic> json) => IklanBuyerData(
        endDate: json["end_date"],
        id: json["id"],
        ongoingWeight: json["ongoing_weight"],
        requestedWeight: json["requested_weight"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "end_date": endDate,
        "id": id,
        "ongoing_weight": ongoingWeight,
        "requested_weight": requestedWeight,
        "title": title,
    };
}
