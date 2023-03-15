// To parse this JSON data, do
//
//     final iklanSellerDetail = iklanSellerDetailFromJson(jsonString);

import 'dart:convert';

IklanSellerDetail iklanSellerDetailFromJson(String str) =>
    IklanSellerDetail.fromJson(json.decode(str));

String iklanSellerDetailToJson(IklanSellerDetail data) =>
    json.encode(data.toJson());

class IklanSellerDetail {
  IklanSellerDetail({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  IklanSellerDetailData data;
  String message;
  int statusCode;

  factory IklanSellerDetail.fromJson(Map<String, dynamic> json) =>
      IklanSellerDetail(
        data: IklanSellerDetailData.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status_code": statusCode,
      };
}

class IklanSellerDetailData {
  IklanSellerDetailData({
    required this.additionalInformation,
    required this.category,
    required this.id,
    required this.location,
    required this.maximumWeight,
    required this.minimumWeight,
    required this.ongoingWeight,
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
  int ongoingWeight;
  int price;
  int retrievalSystem;
  String title;

  factory IklanSellerDetailData.fromJson(Map<String, dynamic> json) => IklanSellerDetailData(
        additionalInformation: json["additional_information"],
        category: json["category"],
        id: json["id"],
        location: json["location"],
        maximumWeight: json["maximum_weight"],
        minimumWeight: json["minimum_weight"],
        ongoingWeight: json["ongoing_weight"],
        price: json["price"],
        retrievalSystem: json["retrieval_system"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "additional_information": additionalInformation,
        "category": category,
        "id": id,
        "location": location,
        "maximum_weight": maximumWeight,
        "minimum_weight": minimumWeight,
        "ongoing_weight": ongoingWeight,
        "price": price,
        "retrieval_system": retrievalSystem,
        "title": title,
      };
}
