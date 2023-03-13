// To parse this JSON data, do
//
//     final iklanSeller = iklanSellerFromJson(jsonString);

import 'dart:convert';

IklanSeller iklanSellerFromJson(String str) => IklanSeller.fromJson(json.decode(str));

String iklanSellerToJson(IklanSeller data) => json.encode(data.toJson());

class IklanSeller {
    IklanSeller({
        required this.data,
        required this.message,
        required this.statusCode,
    });

    List<IklanSellerData> data;
    String message;
    int statusCode;

    factory IklanSeller.fromJson(Map<String, dynamic> json) => IklanSeller(
        data: List<IklanSellerData>.from(json["data"].map((x) => IklanSellerData.fromJson(x))),
        message: json["message"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status_code": statusCode,
    };
}

class IklanSellerData {
    IklanSellerData({
        required this.id,
        required this.price,
        required this.requestedWeight,
        required this.title,
    });

    String id;
    int price;
    int requestedWeight;
    String title;

    factory IklanSellerData.fromJson(Map<String, dynamic> json) => IklanSellerData(
        id: json["id"],
        price: json["price"],
        requestedWeight: json["requested_weight"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "requested_weight": requestedWeight,
        "title": title,
    };
}
