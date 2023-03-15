// To parse this JSON data, do
//
//     final transactionSeller = transactionSellerFromJson(jsonString);

import 'dart:convert';

TransactionSeller transactionSellerFromJson(String str) =>
    TransactionSeller.fromJson(json.decode(str));

String transactionSellerToJson(TransactionSeller data) =>
    json.encode(data.toJson());

class TransactionSeller {
  TransactionSeller({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  List<TransactionSellerData> data;
  String message;
  int statusCode;

  factory TransactionSeller.fromJson(Map<String, dynamic> json) =>
      TransactionSeller(
        data: List<TransactionSellerData>.from(
            json["data"].map((x) => TransactionSellerData.fromJson(x))),
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status_code": statusCode,
      };
}

class TransactionSellerData {
  TransactionSellerData({
    required this.createdAt,
    required this.id,
    required this.pabrik,
    required this.status,
    required this.title,
    required this.totalPrice,
  });

  String createdAt;
  String id;
  String pabrik;
  int status;
  String title;
  int totalPrice;

  factory TransactionSellerData.fromJson(Map<String, dynamic> json) =>
      TransactionSellerData(
        createdAt: json["created_at"],
        id: json["id"],
        pabrik: json["pabrik"],
        status: json["status"],
        title: json["title"],
        totalPrice: json["total_price"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "id": id,
        "pabrik": pabrik,
        "status": status,
        "title": title,
        "total_price": totalPrice,
      };
}
