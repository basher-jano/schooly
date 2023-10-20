// To parse this JSON data, do
//
//     final studentUserRes = studentUserResFromJson(jsonString);

import 'dart:convert';

StudentUserRes studentUserResFromJson(String str) =>
    StudentUserRes.fromJson(json.decode(str));

String studentUserResToJson(StudentUserRes data) => json.encode(data.toJson());

class StudentUserRes {
  StudentUserRes({
    required this.isOk,
    required this.result,
    required this.token,
  });

  bool isOk;
  Result result;
  String token;

  factory StudentUserRes.fromJson(Map<String, dynamic> json) => StudentUserRes(
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
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.avatar,
    required this.resultClass,
    required this.avg,
    required this.attendanceRate,
  });

  int id;
  String name;
  String email;
  String address;
  String phone;
  String avatar;
  String resultClass;
  double avg;
  int attendanceRate;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        avatar: json["avatar"],
        resultClass: json["class"],
        avg: json["avg"].toDouble(),
        attendanceRate: json["attendance_rate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "phone": phone,
        "avatar": avatar,
        "class": resultClass,
        "avg": avg,
        "attendance_rate": attendanceRate,
      };
}
