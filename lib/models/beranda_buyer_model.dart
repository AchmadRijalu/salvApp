// To parse this JSON data, do
//
//     final berandaBuyer = berandaBuyerFromJson(jsonString);

import 'dart:convert';

BerandaBuyer berandaBuyerFromJson(String str) =>
    BerandaBuyer.fromJson(json.decode(str));

String berandaBuyerToJson(BerandaBuyer data) => json.encode(data.toJson());

class BerandaBuyer {
  BerandaBuyer({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  List<BerandaBuyerData> data;
  String message;
  int statusCode;

  factory BerandaBuyer.fromJson(Map<String, dynamic> json) => BerandaBuyer(
        data: List<BerandaBuyerData>.from(
            json["data"].map((x) => BerandaBuyerData.fromJson(x))),
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status_code": statusCode,
      };
}

class BerandaBuyerData {
  BerandaBuyerData({
    required this.category,
    required this.finishedWeight,
    required this.id,
  });

  String category;
  int finishedWeight;
  String id;

  factory BerandaBuyerData.fromJson(Map<String, dynamic> json) =>
      BerandaBuyerData(
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
