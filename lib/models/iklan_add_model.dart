// To parse this JSON data, do
//
//     final iklanAdd = iklanAddFromJson(jsonString);

import 'dart:convert';

IklanAddModel iklanAddFromJson(String str) => IklanAddModel.fromJson(json.decode(str));

String iklanAddToJson(IklanAddModel data) => json.encode(data.toJson());

class IklanAddModel {
    IklanAddModel({
        required this.message,
        required this.statusCode,
    });

    String message;
    int statusCode;

    factory IklanAddModel.fromJson(Map<String, dynamic> json) => IklanAddModel(
        message: json["message"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
    };
}
