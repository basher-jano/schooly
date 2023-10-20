class videosstudent {
  bool? isOk;
  List<Result>? result;

  videosstudent({this.isOk, this.result});

  videosstudent.fromJson(Map<String, dynamic> json) {
    isOk = json['isOk'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isOk'] = this.isOk;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? id;
  Grade? grade;
  String? description;
  String? video;

  Result({this.id, this.grade, this.description, this.video});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    description = json['description'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
    data['description'] = this.description;
    data['video'] = this.video;
    return data;
  }
}

class Grade {
  int? id;
  String? name;

  Grade({this.id, this.name});

  Grade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}