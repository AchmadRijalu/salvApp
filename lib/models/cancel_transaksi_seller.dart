// To parse this JSON data, do
//
//     final cancelSeller = cancelSellerFromJson(jsonString);

import 'dart:convert';

CancelSeller cancelSellerFromJson(String str) =>
    CancelSeller.fromJson(json.decode(str));

String cancelSellerToJson(CancelSeller data) => json.encode(data.toJson());

class CancelSeller {
  CancelSeller({
    required this.message,
    required this.statusCode,
  });

  String message;
  int statusCode;

  factory CancelSeller.fromJson(Map<String, dynamic> json) => CancelSeller(
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
      };
}
