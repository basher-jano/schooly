// To parse this JSON data, do
//
//     final ads = adsFromJson(jsonString);

import 'dart:convert';

Ads adsFromJson(String str) => Ads.fromJson(json.decode(str));

String adsToJson(Ads data) => json.encode(data.toJson());

class Ads {
  Ads({
    required this.isOk,
    required this.result,
  });

  bool isOk;
  List<Result> result;

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
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
    required this.content,
    required this.image,
  });

  String content;
  String image;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        content: json["content"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "image": image,
      };
}
