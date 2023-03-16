// To parse this JSON data, do
//
//     final berandaSeller = berandaSellerFromJson(jsonString);

import 'dart:convert';

BerandaSeller berandaSellerFromJson(String str) =>
    BerandaSeller.fromJson(json.decode(str));

String berandaSellerToJson(BerandaSeller data) => json.encode(data.toJson());

class BerandaSeller {
  BerandaSeller({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  List<BerandaSellerData> data;
  String message;
  int statusCode;

  factory BerandaSeller.fromJson(Map<String, dynamic> json) => BerandaSeller(
        data: List<BerandaSellerData>.from(
            json["data"].map((x) => BerandaSellerData.fromJson(x))),
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status_code": statusCode,
      };
}

class BerandaSellerData {
  BerandaSellerData({
    required this.category,
    required this.finishedWeight,
    required this.id,
  });

  String category;
  int finishedWeight;
  String id;

  factory BerandaSellerData.fromJson(Map<String, dynamic> json) =>
      BerandaSellerData(
        category: json["category"],
        finishedWeight: json["finished_weight"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "finished_weight": finishedWeight,
        "id": id,
      };
}
