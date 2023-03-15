// To parse this JSON data, do
//
//     final detailTransaksiBuyer = detailTransaksiBuyerFromJson(jsonString);

import 'dart:convert';

DetailTransaksiBuyer detailTransaksiBuyerFromJson(String str) =>
    DetailTransaksiBuyer.fromJson(json.decode(str));

String detailTransaksiBuyerToJson(DetailTransaksiBuyer data) =>
    json.encode(data.toJson());

class DetailTransaksiBuyer {
  DetailTransaksiBuyer({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  DetailTransaksiBuyerData data;
  String message;
  int statusCode;

  factory DetailTransaksiBuyer.fromJson(Map<String, dynamic> json) =>
      DetailTransaksiBuyer(
        data: DetailTransaksiBuyerData.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status_code": statusCode,
      };
}

class DetailTransaksiBuyerData {
  DetailTransaksiBuyerData({
    required this.additionalInformation,
    required this.category,
    required this.id,
    required this.location,
    required this.maximumWeight,
    required this.minimumWeight,
    required this.price,
    required this.retrievalSystem,
    required this.title,
    required this.totalPrice,
    required this.weight,
  });

  String additionalInformation;
  String category;
  String id;
  String location;
  int maximumWeight;
  int minimumWeight;
  int price;
  int retrievalSystem;
  String title;
  int totalPrice;
  int weight;

  factory DetailTransaksiBuyerData.fromJson(Map<String, dynamic> json) =>
      DetailTransaksiBuyerData(
        additionalInformation: json["additional_information"],
        category: json["category"],
        id: json["id"],
        location: json["location"],
        maximumWeight: json["maximum_weight"],
        minimumWeight: json["minimum_weight"],
        price: json["price"],
        retrievalSystem: json["retrieval_system"],
        title: json["title"],
        totalPrice: json["total_price"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "additional_information": additionalInformation,
        "category": category,
        "id": id,
        "location": location,
        "maximum_weight": maximumWeight,
        "minimum_weight": minimumWeight,
        "price": price,
        "retrieval_system": retrievalSystem,
        "title": title,
        "total_price": totalPrice,
        "weight": weight,
      };
}
