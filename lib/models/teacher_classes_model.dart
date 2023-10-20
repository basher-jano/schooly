// To parse this JSON data, do
//
//     final teacherClasses = teacherClassesFromJson(jsonString);

import 'dart:convert';

TeacherClasses teacherClassesFromJson(String str) => TeacherClasses.fromJson(json.decode(str));

String teacherClassesToJson(TeacherClasses data) => json.encode(data.toJson());

class TeacherClasses {
    TeacherClasses({
        required this.isOk,
        required this.result,
    });

    bool isOk;
    Result result;

    factory TeacherClasses.fromJson(Map<String, dynamic> json) => TeacherClasses(
        isOk: json["isOk"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "isOk": isOk,
        "result": result.toJson(),
    };
}

class Result {
    Result({
        required this.classes,
        required this.count,
    });

    List<Class> classes;
    int count;

    factory Result.fromJson(Map<dynamic, dynamic> json) => Result(
        classes: List<Class>.from(json["classes"].map((x) => Class.fromJson(x))),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "classes": List<dynamic>.from(classes.map((x) => x.toJson())),
        "count": count,
    };
}

class Class {
    Class({
        required this.id,
        required this.name,
        required this.capcity,
    });

    int id;
   String name;
    int capcity;

    factory Class.fromJson(Map<dynamic, dynamic> json) => Class(
        id: json["id"],
      name: json["name"],
        capcity: json["capcity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    //    "name": name,
        "capcity": capcity,
    };
}
