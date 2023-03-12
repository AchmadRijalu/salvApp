// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
     this.data,
     this.message,
     this.statusCode,
  });

  final Userdata? data;
  final String? message;
  final int? statusCode;

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: Userdata.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
        "status_code": statusCode,
      };
}

class Userdata {
  Userdata({
     this.address,
     this.city,
     this.id,
    this.image,
     this.name,
     this.password,
     this.phoneNumber,
     this.postalCode,
     this.province,
     this.subdistrict,
     this.token,
     this.type,
     this.username,
     this.ward,
  });

  final String? address;
  final String? city;
  final String? id;
  final dynamic? image;
  final String? name;
  final String? password;
  final String? phoneNumber;
  final String? postalCode;
  final String? province;
  final String? subdistrict;
  final String? token;
  final String? type;
  final String? username;
  final String? ward;

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        address: json["address"],
        id: json["id"],
        city: json["city"],
        image: json["image"],
        name: json["name"],
        password: json["password"],
        phoneNumber: json["phone_number"],
        postalCode: json["postal_code"],
        province: json["province"],
        subdistrict: json["subdistrict"],
        token: json["token"],
        type: json["type"],
        username: json["username"],
        ward: json["ward"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['city'] = city;
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['password'] = password;
    data['phone_number'] = phoneNumber;
    data['postal_code'] = postalCode;
    data['province'] = province;
    data['subdistrict'] = subdistrict;
    data['token'] = token;
    data['type'] = type;
    data['username'] = name;
    data['ward'] = ward;

    return data;
  }
}

List<Userdata> userList = [
  Userdata(
      address: "Jl Ayani 68-70",
      city: "Surabaya",
      name: "Achmad Rijalu",
      password: "12345678",
      phoneNumber: "081231149830",
      postalCode: "60231",
      province: "Jawa Timur",
      subdistrict: "Ketintang",
      token:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY3NzkxMTQ0",
      type: "buyer",
      username: "Achmad Rijalu ",
      ward: "Gayungan"),
  // Userdata(
  //     address: "Jl Ayani 68-70",
  //     city: "Surabaya",
  //     id: "2",
  //     name: "Michael Eko",
  //     password: "12345678",
  //     phoneNumber: "081231149831",
  //     postalCode: "60231",
  //     province: "Jawa Timur",
  //     subdistrict: "Ketintang",
  //     token:
  //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY3NzkxMTQ0",
  //     type: "seller",
  //     username: "Michael Eko",
  //     ward: "Gayungan")
];
