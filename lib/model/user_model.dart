// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String name;
  String email;
  String phone;
  String username;
  String usertype;
  dynamic profilePicture;
  dynamic about;
  dynamic gender;
  bool status;
  dynamic emailVerifiedAt;
  dynamic phoneVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.username,
    required this.usertype,
    this.profilePicture,
    this.about,
    this.gender,
    required this.status,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    username: json["username"],
    usertype: json["usertype"],
    profilePicture: json["profile_picture"],
    about: json["about"],
    gender: json["gender"],
    status: json["status"],
    emailVerifiedAt: json["email_verified_at"],
    phoneVerifiedAt: json["phone_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "username": username,
    "usertype": usertype,
    "profile_picture": profilePicture,
    "about": about,
    "gender": gender,
    "status": status,
    "email_verified_at": emailVerifiedAt,
    "phone_verified_at": phoneVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
  UserModel copyWith({
    String? name,
    phone,
    email,
    gender
  }) =>
      UserModel(
        id: id,
        name: name ?? this.name,
        email: email,
        gender: gender??this.gender,
        phone: phone??this.phone, username: username, usertype: usertype, status: status, createdAt: createdAt, updatedAt: updatedAt,

      );
}
