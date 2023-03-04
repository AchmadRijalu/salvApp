import 'dart:convert';

Provinsi provinceFromJson(String str) => Provinsi.fromJson(json.decode(str));

String provinceToJson(Provinsi data) => json.encode(data.toJson());

class Provinsi {
  Provinsi({
    required this.provinsi,
  });

  final List<ListProvinsi> provinsi;

  factory Provinsi.fromJson(Map<String, dynamic> json) => Provinsi(
        provinsi: List<ListProvinsi>.from(
            json["provinsi"].map((x) => ListProvinsi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "provinsi": List<dynamic>.from(provinsi.map((x) => x.toJson())),
      };
}

class ListProvinsi {
  ListProvinsi({
    required this.id,
    required this.nama,
  });

  final int id;
  final String nama;

  factory ListProvinsi.fromJson(Map<String, dynamic> json) => ListProvinsi(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}
