// To parse this JSON data, do
//
//     final transaksiSeller = transaksiSellerFromJson(jsonString);

import 'dart:convert';

TransaksiSeller transaksiSellerFromJson(String str) =>
    TransaksiSeller.fromJson(json.decode(str));

String transaksiSellerToJson(TransaksiSeller data) =>
    json.encode(data.toJson());

class TransaksiSeller {
  TransaksiSeller({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  List<TransaksiSellerData> data;
  String message;
  int statusCode;

  factory TransaksiSeller.fromJson(Map<String, dynamic> json) =>
      TransaksiSeller(
        data: List<TransaksiSellerData>.from(
            json["data"].map((x) => TransaksiSellerData.fromJson(x))),
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status_code": statusCode,
      };
}

class TransaksiSellerData {
  TransaksiSellerData({
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

  factory TransaksiSellerData.fromJson(Map<String, dynamic> json) =>
      TransaksiSellerData(
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
        "pabrik": pabrikValues.reverse[pabrik],
        "status": status,
        "title": title,
        "total_price": totalPrice,
      };
}

enum Pabrik { JON_MEDINA, JAMES_MARSH, ACHMAD_RIJALU }

final pabrikValues = EnumValues({
  "Achmad Rijalu": Pabrik.ACHMAD_RIJALU,
  "James Marsh": Pabrik.JAMES_MARSH,
  "Jon Medina": Pabrik.JON_MEDINA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
