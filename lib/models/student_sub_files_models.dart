// To parse this JSON data, do
//
//     final subjectFiles = subjectFilesFromJson(jsonString);

import 'dart:convert';

SubjectFiles subjectFilesFromJson(String str) => SubjectFiles.fromJson(json.decode(str));

String subjectFilesToJson(SubjectFiles data) => json.encode(data.toJson());

class SubjectFiles {
    SubjectFiles({
        required this.isOk,
        required this.result,
    });

    bool isOk;
    List<Result> result;

    factory SubjectFiles.fromJson(Map<String, dynamic> json) => SubjectFiles(
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
        required this.grade,
        required this.description,
        required this.document,
    });

    int id;
    Grade grade;
    String description;
    String document;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        grade: Grade.fromJson(json["grade"]),
        description: json["description"],
        document: json["document"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "grade": grade.toJson(),
        "description": description,
        "document": document,
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
