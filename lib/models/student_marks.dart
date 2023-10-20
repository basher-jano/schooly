class mark {
  bool? isOk;
  List<Result>? result;

  mark({this.isOk, this.result});

  mark.fromJson(Map<String, dynamic> json) {
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
  int? examMark;
  int? quizeMark;
  String? subject;

  Result({this.examMark, this.quizeMark, this.subject});

  Result.fromJson(Map<String, dynamic> json) {
    examMark = json['exam_mark'];
    quizeMark = json['quize_mark'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exam_mark'] = this.examMark;
    data['quize_mark'] = this.quizeMark;
    data['subject'] = this.subject;
    return data;
  }
}