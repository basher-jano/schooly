// To parse this JSON data, do
//
//     final studentEvaloations = studentEvaloationsFromJson(jsonString);

import 'dart:convert';

StudentEvaloations studentEvaloationsFromJson(String str) =>
    StudentEvaloations.fromJson(json.decode(str));

String studentEvaloationsToJson(StudentEvaloations data) =>
    json.encode(data.toJson());

class StudentEvaloations {
  StudentEvaloations({
    required this.isOk,
    required this.result,
  });

  bool isOk;
  List<Result> result;

  factory StudentEvaloations.fromJson(Map<String, dynamic> json) =>
      StudentEvaloations(
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
    required this.note,
    required this.evaloation,
    required this.teacher,
    required this.subject,
    required this.createdAt,
  });

  String note;
  String evaloation;
  String teacher;
  String subject;
  DateTime createdAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        note: json["note"],
        evaloation: json["evaloation"],
        teacher: json["teacher"],
        subject: json["subject"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "note": note,
        "evaloation": evaloation,
        "teacher": teacher,
        "subject": subject,
      };
}
