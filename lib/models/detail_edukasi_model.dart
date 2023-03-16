// To parse this JSON data, do
//
//     final edukasiDetail = edukasiDetailFromJson(jsonString);

import 'dart:convert';

EdukasiDetail edukasiDetailFromJson(String str) => EdukasiDetail.fromJson(json.decode(str));

String edukasiDetailToJson(EdukasiDetail data) => json.encode(data.toJson());

class EdukasiDetail {
    EdukasiDetail({
        required this.data,
        required this.message,
        required this.statusCode,
    });

    EdukasiDetailData data;
    String message;
    int statusCode;

    factory EdukasiDetail.fromJson(Map<String, dynamic> json) => EdukasiDetail(
        data: EdukasiDetailData.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status_code": statusCode,
    };
}

class EdukasiDetailData {
    EdukasiDetailData({
        this.children,
        required this.content,
        required this.duration,
        required this.id,
        required this.implementation,
        required this.preparation,
        required this.title,
        required this.video,
    });

    List<EdukasiDetailData>? children;
    String content;
    int duration;
    String id;
    String implementation;
    String preparation;
    String title;
    String video;

    factory EdukasiDetailData.fromJson(Map<String, dynamic> json) => EdukasiDetailData(
        children: json["children"] == null ? [] : List<EdukasiDetailData>.from(json["children"]!.map((x) => EdukasiDetailData.fromJson(x))),
        content: json["content"],
        duration: json["duration"],
        id: json["id"],
        implementation: json["implementation"],
        preparation: json["preparation"],
        title: json["title"],
        video: json["video"],
    );

    Map<String, dynamic> toJson() => {
        "children": children == null ? [] : List<dynamic>.from(children!.map((x) => x.toJson())),
        "content": content,
        "duration": duration,
        "id": id,
        "implementation": implementation,
        "preparation": preparation,
        "title": title,
        "video": video,
    };
}
