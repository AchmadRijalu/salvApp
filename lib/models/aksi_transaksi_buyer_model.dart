// To parse this JSON data, do
//
//     final aksiTransaksiBuyer = aksiTransaksiBuyerFromJson(jsonString);

import 'dart:convert';

AksiTransaksiBuyer aksiTransaksiBuyerFromJson(String str) =>
    AksiTransaksiBuyer.fromJson(json.decode(str));

String aksiTransaksiBuyerToJson(AksiTransaksiBuyer data) =>
    json.encode(data.toJson());

class AksiTransaksiBuyer {
  AksiTransaksiBuyer({
    required this.statusCode,
    required this.message,
  });

  int statusCode;
  String message;

  factory AksiTransaksiBuyer.fromJson(Map<String, dynamic> json) =>
      AksiTransaksiBuyer(
        statusCode: json["status_code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
      };
}
