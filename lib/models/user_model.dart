// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  final Data data;
  final String message;
  final int statusCode;

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status_code": statusCode,
      };
}

class Data {
  Data({
    required this.address,
    required this.city,
    required this.id,
    this.image,
    required this.name,
    required this.password,
    required this.phoneNumber,
    required this.postalCode,
    required this.province,
    required this.subdistrict,
    required this.type,
    required this.username,
    required this.ward,
  });

  final String address;
  final String city;
  final String id;
  final dynamic image;
  final String name;
  final String password;
  final String phoneNumber;
  final String postalCode;
  final String province;
  final String subdistrict;
  final String type;
  final String username;
  final String ward;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        address: json["address"],
        city: json["city"],
        id: json["id"],
        image: json["image"],
        name: json["name"],
        password: json["password"],
        phoneNumber: json["phone_number"],
        postalCode: json["postal_code"],
        province: json["province"],
        subdistrict: json["subdistrict"],
        type: json["type"],
        username: json["username"],
        ward: json["ward"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "id": id,
        "image": image,
        "name": name,
        "password": password,
        "phone_number": phoneNumber,
        "postal_code": postalCode,
        "province": province,
        "subdistrict": subdistrict,
        "type": type,
        "username": username,
        "ward": ward,
      };
}
