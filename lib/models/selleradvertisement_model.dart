// To parse this JSON data, do
//
//     final sellerAdvertisement = sellerAdvertisementFromJson(jsonString);

import 'dart:convert';

SellerAdvertisement sellerAdvertisementFromJson(String str) => SellerAdvertisement.fromJson(json.decode(str));

String sellerAdvertisementToJson(SellerAdvertisement data) => json.encode(data.toJson());

class SellerAdvertisement {
    SellerAdvertisement({
        required this.data,
        required this.statusCode,
    });

    List<Datum> data;
    int statusCode;

    factory SellerAdvertisement.fromJson(Map<String, dynamic> json) => SellerAdvertisement(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status_code": statusCode,
    };
}

class Datum {
    Datum({
        required this.id,
        required this.ongoingWeight,
        required this.price,
        required this.requestedWeight,
        required this.title,
    });

    String id;
    int ongoingWeight;
    int price;
    int requestedWeight;
    String title;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        ongoingWeight: json["ongoing_weight"],
        price: json["price"],
        requestedWeight: json["requested_weight"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ongoing_weight": ongoingWeight,
        "price": price,
        "requested_weight": requestedWeight,
        "title": title,
    };
}
