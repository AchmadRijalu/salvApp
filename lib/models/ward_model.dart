// To parse this JSON data, do
//
//     final kelurahan = kelurahanFromJson(jsonString);

import 'dart:convert';

Kelurahan kelurahanFromJson(String str) => Kelurahan.fromJson(json.decode(str));

String kelurahanToJson(Kelurahan data) => json.encode(data.toJson());

class Kelurahan {
    Kelurahan({
        required this.code,
        required this.messages,
        required this.kelurahanvalue,
    });

    String code;
    String messages;
    List<KelurahanValue> kelurahanvalue;

    factory Kelurahan.fromJson(Map<String, dynamic> json) => Kelurahan(
        code: json["code"],
        messages: json["messages"],
        kelurahanvalue: List<KelurahanValue>.from(json["value"].map((x) => KelurahanValue.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "messages": messages,
        "value": List<dynamic>.from(kelurahanvalue.map((x) => x.toJson())),
    };
}

class KelurahanValue {
    KelurahanValue({
        required this.id,
        required this.idKecamatan,
        required this.name,
    });

    String id;
    String idKecamatan;
    String name;

    factory KelurahanValue.fromJson(Map<String, dynamic> json) => KelurahanValue(
        id: json["id"],
        idKecamatan: json["id_kecamatan"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_kecamatan": idKecamatan,
        "name": name,
    };
}
