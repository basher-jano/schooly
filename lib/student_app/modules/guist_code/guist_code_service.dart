import 'dart:convert';

import 'package:my_school/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:my_school/models/guist_courses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuistCodeService {
  var Url =
      Uri.parse(ServerConfig.DNS + ServerConfig.guist_course + '?course_code=');
  var result = [];
  var message = '';
  var courses;
  var gradeID;
  var subjectID;
  bool isOk = true;

  Future sendCode(String code) async {
    Url = Uri.parse(
        ServerConfig.DNS + ServerConfig.guist_course + '?course_code=' + code);
    var response = await http.get(
      Url,
    );
    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode == 200) {
      print('it is 200');
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true) {
        print('it is ok');
        isOk = true;
        courses = guistCoursesFromJson(response.body);
        // print(courses.result[0].subject.id);
        // print(courses.result[0].grade.id);
        gradeID = courses.result[0].grade.id;
        subjectID = courses.result[0].subject.id;
        // print(gradeID);
        // print(subjectID);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(
            'g' + gradeID.toString() + 's' + subjectID.toString(), code);
        print('g' + gradeID.toString() + 's' + subjectID.toString());
        print(prefs
            .getString('g' + gradeID.toString() + 's' + subjectID.toString()));
        return courses.result;
      } else {
        print('it is not ok');
        isOk = false;
        message = jsonResponse['message'];
        print(message);
        return [];
      }
    } else
      return [];
  }
}
