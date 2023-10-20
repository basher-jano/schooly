// To parse this JSON data, do
//
//     final studentAdsFiles = studentAdsFilesFromJson(jsonString);

import 'dart:convert';

StudentAdsFiles studentAdsFilesFromJson(String str) => StudentAdsFiles.fromJson(json.decode(str));

String studentAdsFilesToJson(StudentAdsFiles data) => json.encode(data.toJson());

class StudentAdsFiles {
    StudentAdsFiles({
        required this.isOk,
        required this.result,
    });

    bool isOk;
    List<Result> result;

    factory StudentAdsFiles.fromJson(Map<String, dynamic> json) => StudentAdsFiles(
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
        required this.content,
        required this.file,
    });

    String content;
    String file;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        content: json["content"],
        file: json["file"],
    );

    Map<String, dynamic> toJson() => {
        "content": content,
        "file": file,
    };
}
