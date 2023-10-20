// To parse this JSON data, do
//
//     final classStudens = classStudensFromJson(jsonString);

import 'dart:convert';

ClassStudens classStudensFromJson(String str) => ClassStudens.fromJson(json.decode(str));

String classStudensToJson(ClassStudens data) => json.encode(data.toJson());

class ClassStudens {
    ClassStudens({
        required this.isOk,
        required this.result,
    });

    bool isOk;
    List<Result> result;

    factory ClassStudens.fromJson(Map<String, dynamic> json) => ClassStudens(
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
        required this.name,
        required this.email,
        required this.address,
        required this.phone,
        required this.avatar,
        required this.marks,
        required this.evaluation,
    });

    int id;
    String name;
    String email;
    String address;
    String phone;
    String avatar;
    Marks marks;
    List<Evaluation> evaluation;

    factory Result.fromJson(Map<dynamic, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        avatar: json["avatar"],
        marks: Marks.fromJson(json["marks"]),
        evaluation: List<Evaluation>.from(json["evaluation"].map((x) => Evaluation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "phone": phone,
        "avatar": avatar,
        "marks": marks.toJson(),
        "evaluation": List<dynamic>.from(evaluation.map((x) => x.toJson())),
    };
}

class Evaluation {
    Evaluation({
        required this.note,
        required this.evaloation,
    });

    var note;
    var evaloation;

    factory Evaluation.fromJson(Map<dynamic, dynamic> json) => Evaluation(
        note: json["note"],
        evaloation: json["evaloation"],
    );

    Map<String, dynamic> toJson() => {
        "note": note,
        "evaloation": evaloation,
    };
}

class Marks {
    Marks({
        required this.examMark,
        required this.quizeMark,
        required this.attendanceRate,
    });

    int? examMark;
    int? quizeMark;
    double ?attendanceRate;

    factory Marks.fromJson(Map<String, dynamic> json) => Marks(
        examMark: json["exam_mark"] == null ? null : json["exam_mark"],
        quizeMark: json["quize_mark"] == null ? null : json["quize_mark"],
        attendanceRate: json["attendance_rate"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "exam_mark": examMark == null ? null : examMark,
        "quize_mark": quizeMark == null ? null : quizeMark,
        "attendance_rate": attendanceRate,
    };
}