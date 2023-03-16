// To parse this JSON data, do
//
//     final aksiTransaksiSeller = aksiTransaksiSellerFromJson(jsonString);

import 'dart:convert';

AksiTransaksiSeller aksiTransaksiSellerFromJson(String str) =>
    AksiTransaksiSeller.fromJson(json.decode(str));

String aksiTransaksiSellerToJson(AksiTransaksiSeller data) =>
    json.encode(data.toJson());

class AksiTransaksiSeller {
  AksiTransaksiSeller({
    required this.message,
    required this.statusCode,
  });

  String message;
  int statusCode;

  factory AksiTransaksiSeller.fromJson(Map<String, dynamic> json) =>
      AksiTransaksiSeller(
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
      };
}
