// To parse this JSON data, do
//
//     final guistCourses = guistCoursesFromJson(jsonString);

import 'dart:convert';

GuistCourses guistCoursesFromJson(String str) =>
    GuistCourses.fromJson(json.decode(str));

String guistCoursesToJson(GuistCourses data) => json.encode(data.toJson());

class GuistCourses {
  GuistCourses({
    required this.isOk,
    required this.result,
  });

  bool isOk;
  List<Result> result;

  factory GuistCourses.fromJson(Map<String, dynamic> json) => GuistCourses(
        isOk: json["isOk"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isOk": isOk,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.grade,
    required this.subject,
    required this.description,
    required this.video,
  });

  int id;
  Grade grade;
  Grade subject;
  String description;
  String video;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        grade: Grade.fromJson(json["grade"]),
        subject: Grade.fromJson(json["subject"]),
        description: json["description"],
        video: json["video"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "grade": grade.toJson(),
        "subject": subject.toJson(),
        "description": description,
        "video": video,
      };
}

class Grade {
  Grade({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Grade.fromJson(Map<String, dynamic> json) => Grade(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
