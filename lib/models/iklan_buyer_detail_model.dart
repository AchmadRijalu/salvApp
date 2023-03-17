// To parse this JSON data, do
//
//     final iklanSellerDetail = iklanSellerDetailFromJson(jsonString);

import 'dart:convert';

IklanBuyerDetail iklanSellerDetailFromJson(String str) => IklanBuyerDetail.fromJson(json.decode(str));

String iklanSellerDetailToJson(IklanBuyerDetail data) => json.encode(data.toJson());

class IklanBuyerDetail {
    IklanBuyerDetail({
        required this.data,
        required this.message,
        required this.statusCode,
    });

    IklanBuyerDetailData data;
    String message;
    int statusCode;

    factory IklanBuyerDetail.fromJson(Map<String, dynamic> json) => IklanBuyerDetail(
        data: IklanBuyerDetailData.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status_code": statusCode,
    };
}

class IklanBuyerDetailData {
    IklanBuyerDetailData({
        required this.additionalInformation,
        required this.category,
        required this.id,
        required this.status,
        required this.location,
        required this.maximumWeight,
        required this.minimumWeight,
        required this.price,
        required this.retrievalSystem,
        required this.title,
    });

    String additionalInformation;
    String category;
    String id;
    String location;
    int maximumWeight;
    int minimumWeight;
    int price;
    String status;
    int retrievalSystem;
    String title;

    factory IklanBuyerDetailData.fromJson(Map<String, dynamic> json) => IklanBuyerDetailData(
        additionalInformation: json["additional_information"],
        status: json["status"],
        category: json["category"],
        id: json["id"],
        location: json["location"],
        maximumWeight: json["maximum_weight"],
        minimumWeight: json["minimum_weight"],
        price: json["price"],
        retrievalSystem: json["retrieval_system"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "additional_information": additionalInformation,
        "category": category,
        "id": id,
        "location": location,
        "status": status,
        "maximum_weight": maximumWeight,
        "minimum_weight": minimumWeight,
        "price": price,
        "retrieval_system": retrievalSystem,
        "title": title,
    };
}
