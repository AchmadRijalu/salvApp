// To parse this JSON data, do
//
//     final transaksi = transaksiFromJson(jsonString);

import 'dart:convert';

Transaksi transaksiFromJson(String str) => Transaksi.fromJson(json.decode(str));

String transaksiToJson(Transaksi data) => json.encode(data.toJson());

class Transaksi {
    Transaksi({
        required this.data,
        required this.message,
        required this.statusCode,
    });

    List<TransaksiData> data;
    String message;
    int statusCode;

    factory Transaksi.fromJson(Map<String, dynamic> json) => Transaksi(
        data: List<TransaksiData>.from(json["data"].map((x) => TransaksiData.fromJson(x))),
        message: json["message"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status_code": statusCode,
    };
}

class TransaksiData {
    TransaksiData({
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

    factory TransaksiData.fromJson(Map<String, dynamic> json) => TransaksiData(
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
