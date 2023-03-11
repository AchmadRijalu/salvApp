// To parse this JSON data, do
//
//     final provinsi = provinsiFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Provinsi {
    Provinsi({
        required this.code,
        required this.messages,
        required this.provinsiValue,
    });

    final String code;
    final String messages;
    final List<ProvinsiValue> provinsiValue;

    factory Provinsi.fromRawJson(String str) => Provinsi.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Provinsi.fromJson(Map<String, dynamic> json) => Provinsi(
        code: json["code"],
        messages: json["messages"],
        provinsiValue: List<ProvinsiValue>.from(json["value"].map((x) => ProvinsiValue.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "messages": messages,
        "value": List<dynamic>.from(provinsiValue.map((x) => x.toJson())),
    };
}

class ProvinsiValue {
    ProvinsiValue({
        required this.id,
        required this.name,
    });

    final String id;
    final String name;

    factory ProvinsiValue.fromRawJson(String str) => ProvinsiValue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProvinsiValue.fromJson(Map<String, dynamic> json) => ProvinsiValue(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
