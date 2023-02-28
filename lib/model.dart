// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.name,
    required this.phone,
    required this.age,
    required this.gender,
    required this.passport,
    required this.familyMembers,
    required this.id,
  });

  String name;
  String phone;
  int age;
  String gender;
  String passport;
  List<String> familyMembers;
  String id;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    phone: json["phone"],
    age: json["age"],
    gender: json["gender"],
    passport: json["passport"],
    familyMembers: List<String>.from(json["familyMembers"].map((x) => x)),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "age": age,
    "gender": gender,
    "passport": passport,
    "familyMembers": List<dynamic>.from(familyMembers.map((x) => x)),
    "id": id,
  };
}
