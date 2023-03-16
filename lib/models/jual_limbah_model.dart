// To parse this JSON data, do
//
//     final jualLimbah = jualLimbahFromJson(jsonString);

import 'dart:convert';

JualLimbah jualLimbahFromJson(String str) => JualLimbah.fromJson(json.decode(str));

String jualLimbahToJson(JualLimbah data) => json.encode(data.toJson());

class JualLimbah {
    JualLimbah({
        required this.message,
        required this.statusCode,
    });

    String message;
    int statusCode;

    factory JualLimbah.fromJson(Map<String, dynamic> json) => JualLimbah(
        message: json["message"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
    };
}
