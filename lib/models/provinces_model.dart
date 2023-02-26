import 'dart:convert';

List<Provinces> provincesFromJson(String str) =>
    List<Provinces>.from(json.decode(str).map((x) => Provinces.fromJson(x)));

String provincesToJson(List<Provinces> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Provinces {
  Provinces({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory Provinces.fromJson(Map<String, dynamic> json) => Provinces(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
