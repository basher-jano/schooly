// To parse this JSON data, do
//
//     final studentNotification = studentNotificationFromJson(jsonString);

import 'dart:convert';

StudentNotification studentNotificationFromJson(String str) => StudentNotification.fromJson(json.decode(str));

String studentNotificationToJson(StudentNotification data) => json.encode(data.toJson());

class StudentNotification {
    StudentNotification({
        required this.isOk,
        required this.result,
    });

    bool isOk;
    List<Result> result;

    factory StudentNotification.fromJson(Map<String, dynamic> json) => StudentNotification(
        isOk: json["isOk"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "isOk": isOk,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        required this.id,
        required this.title,
        required this.content,
        required this.date,
    });

    int id;
    String title;
    String content;
    DateTime date;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "date": date.toIso8601String(),
    };
}
