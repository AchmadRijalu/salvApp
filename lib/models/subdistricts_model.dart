// To parse this JSON data, do
//
//     final kota = kotaFromJson(jsonString);

import 'dart:convert';

Kecamatan kotaFromJson(String str) => Kecamatan.fromJson(json.decode(str));

String kotaToJson(Kecamatan data) => json.encode(data.toJson());

class Kecamatan {
    Kecamatan({
        required this.code,
        required this.messages,
        required this.value,
    });

    String code;
    String messages;
    List<KecamatanValue> value;

    factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
        code: json["code"],
        messages: json["messages"],
        value: List<KecamatanValue>.from(json["value"].map((x) => KecamatanValue.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "messages": messages,
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
    };
}

class KecamatanValue {
    KecamatanValue({
        required this.id,
        required this.idKabupaten,
        required this.name,
    });

    String id;
    String idKabupaten;
    String name;

    factory KecamatanValue.fromJson(Map<String, dynamic> json) => KecamatanValue(
        id: json["id"],
        idKabupaten: json["id_kabupaten"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_kabupaten": idKabupaten,
        "name": name,
    };
}
