// To parse this JSON data, do
//
//     final jualLimbahForm = jualLimbahFormFromJson(jsonString);

import 'dart:convert';

JualLimbahForm jualLimbahFormFromJson(String str) => JualLimbahForm.fromJson(json.decode(str));

String jualLimbahFormToJson(JualLimbahForm data) => json.encode(data.toJson());

class JualLimbahForm {
    JualLimbahForm({
        required this.userId,
        required this.advertisementId,
        required this.weight,
        required this.location,
    });

    String userId;
    String advertisementId;
    int weight;
    String location;

    factory JualLimbahForm.fromJson(Map<String, dynamic> json) => JualLimbahForm(
        userId: json["user_id"],
        advertisementId: json["advertisement_id"],
        weight: json["weight"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "advertisement_id": advertisementId,
        "weight": weight,
        "location": location,
    };
}
