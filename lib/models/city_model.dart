// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
  City({
    required this.kotaKabupaten,
  });

  final List<KotaKabupaten> kotaKabupaten;

  factory City.fromJson(Map<String, dynamic> json) => City(
        kotaKabupaten: List<KotaKabupaten>.from(
            json["kota_kabupaten"].map((x) => KotaKabupaten.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kota_kabupaten":
            List<dynamic>.from(kotaKabupaten.map((x) => x.toJson())),
      };
}

class KotaKabupaten {
  KotaKabupaten({
    required this.id,
    required this.idProvinsi,
    required this.nama,
  });

  final int id;
  final String idProvinsi;
  final String nama;

  factory KotaKabupaten.fromJson(Map<String, dynamic> json) => KotaKabupaten(
        id: json["id"],
        idProvinsi: json["id_provinsi"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_provinsi": idProvinsi,
        "nama": nama,
      };
}
