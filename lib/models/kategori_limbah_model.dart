// To parse this JSON data, do
//
//     final kategoriLimbah = kategoriLimbahFromJson(jsonString);

import 'dart:convert';

KategoriLimbah kategoriLimbahFromJson(String str) => KategoriLimbah.fromJson(json.decode(str));

String kategoriLimbahToJson(KategoriLimbah data) => json.encode(data.toJson());

class KategoriLimbah {
    KategoriLimbah({
        required this.data,
        required this.message,
        required this.statusCode,
    });

    List<KategoriLimbahData> data;
    String message;
    int statusCode;

    factory KategoriLimbah.fromJson(Map<String, dynamic> json) => KategoriLimbah(
        data: List<KategoriLimbahData>.from(json["data"].map((x) => KategoriLimbahData.fromJson(x))),
        message: json["message"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status_code": statusCode,
    };
}

class KategoriLimbahData {
    KategoriLimbahData({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    factory KategoriLimbahData.fromJson(Map<String, dynamic> json) => KategoriLimbahData(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
