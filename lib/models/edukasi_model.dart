// To parse this JSON data, do
//
//     final edukasi = edukasiFromJson(jsonString);

import 'dart:convert';

Edukasi edukasiFromJson(String str) => Edukasi.fromJson(json.decode(str));

String edukasiToJson(Edukasi data) => json.encode(data.toJson());

class Edukasi {
    Edukasi({
        required this.data,
        required this.message,
        required this.statusCode,
    });

    List<EdukasiData> data;
    String message;
    int statusCode;

    factory Edukasi.fromJson(Map<String, dynamic> json) => Edukasi(
        data: List<EdukasiData>.from(json["data"].map((x) => EdukasiData.fromJson(x))),
        message: json["message"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status_code": statusCode,
    };
}

class EdukasiData {
    EdukasiData({
        required this.category,
        required this.duration,
        required this.id,
        required this.thumbnail,
        required this.title,
    });

    String category;
    int duration;
    String id;
    String thumbnail;
    String title;

    factory EdukasiData.fromJson(Map<String, dynamic> json) => EdukasiData(
        category: json["category"],
        duration: json["duration"],
        id: json["id"],
        thumbnail: json["thumbnail"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "duration": duration,
        "id": id,
        "thumbnail": thumbnail,
        "title": title,
    };
}
