// To parse this JSON data, do
//
//     final teacherUserRes = teacherUserResFromJson(jsonString);

import 'dart:convert';

TeacherUserRes teacherUserResFromJson(String str) =>
    TeacherUserRes.fromJson(json.decode(str));

String teacherUserResToJson(TeacherUserRes data) => json.encode(data.toJson());

class TeacherUserRes {
  TeacherUserRes({
    required this.isOk,
    required this.result,
    required this.token,
  });

  bool isOk;
  Result result;
  String token;

  factory TeacherUserRes.fromJson(Map<String, dynamic> json) => TeacherUserRes(
        isOk: json["isOk"],
        result: Result.fromJson(json["result"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "isOk": isOk,
        "result": result.toJson(),
        "token": token,
      };
}

class Result {
  Result({
    required this.id,
    required this.username,
    required this.email,
    this.address,
    required this.phone,
    required this.avatar,
  });

  int id;
  String username;
  String email;
  dynamic address;
  String phone;
  String avatar;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "address": address,
        "phone": phone,
        "avatar": avatar,
      };
}
