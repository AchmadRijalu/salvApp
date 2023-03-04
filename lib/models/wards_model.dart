// To parse this JSON data, do
//
//     final kecamatan = kecamatanFromJson(jsonString);

import 'dart:convert';

Kecamatan kecamatanFromJson(String str) => Kecamatan.fromJson(json.decode(str));

String kecamatanToJson(Kecamatan data) => json.encode(data.toJson());

class Kecamatan {
  Kecamatan({
    required this.kecamatan,
  });

  final List<KecamatanElement> kecamatan;

  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
        kecamatan: List<KecamatanElement>.from(
            json["kecamatan"].map((x) => KecamatanElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kecamatan": List<dynamic>.from(kecamatan.map((x) => x.toJson())),
      };
}

class KecamatanElement {
  KecamatanElement({
    required this.id,
    required this.idKota,
    required this.nama,
  });

  final int id;
  final String idKota;
  final String nama;

  factory KecamatanElement.fromJson(Map<String, dynamic> json) =>
      KecamatanElement(
        id: json["id"],
        idKota: json["id_kota"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_kota": idKota,
        "nama": nama,
      };
}
