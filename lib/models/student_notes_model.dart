// To parse this JSON data, do
//
//     final subjectNotes = subjectNotesFromJson(jsonString);

import 'dart:convert';

SubjectNotes subjectNotesFromJson(String str) => SubjectNotes.fromJson(json.decode(str));

String subjectNotesToJson(SubjectNotes data) => json.encode(data.toJson());

class SubjectNotes {
    SubjectNotes({
        required this.isOk,
        required this.result,
    });

    bool isOk;
    List<Result> result;

    factory SubjectNotes.fromJson(Map<String, dynamic> json) => SubjectNotes(
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
        required this.note,
    });

    int id;
    String note;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        note: json["note"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "note": note,
    };
}
