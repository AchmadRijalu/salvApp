// To parse this JSON data, do
//
//     final batalIklanBuyer = batalIklanBuyerFromJson(jsonString);

import 'dart:convert';

BatalIklanBuyer batalIklanBuyerFromJson(String str) => BatalIklanBuyer.fromJson(json.decode(str));

String batalIklanBuyerToJson(BatalIklanBuyer data) => json.encode(data.toJson());

class BatalIklanBuyer {
    BatalIklanBuyer({
        required this.message,
        required this.statusCode,
    });

    String message;
    int statusCode;

    factory BatalIklanBuyer.fromJson(Map<String, dynamic> json) => BatalIklanBuyer(
        message: json["message"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
    };
}
