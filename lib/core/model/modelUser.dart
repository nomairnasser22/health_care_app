// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String accountType;
  final String email;
  final String gender;
  final Loaction loaction;
  final String name;

  UserModel({
    required this.accountType,
    required this.email,
    required this.gender,
    required this.loaction,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accountType: json["accountType"],
        email: json["email"],
        gender: json["gender"],
        loaction: Loaction.fromJson(json["loaction"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "accountType": accountType,
        "email": email,
        "gender": gender,
        "loaction": loaction.toJson(),
        "name": name,
      };
}

class Loaction {
  final double latitude;
  final double longitude;

  Loaction({
    required this.latitude,
    required this.longitude,
  });

  factory Loaction.fromJson(Map<String, dynamic> json) => Loaction(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
