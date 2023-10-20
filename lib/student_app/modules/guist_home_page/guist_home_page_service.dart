import 'dart:convert';
import 'package:my_school/models/class_guest_model.dart';
import 'package:my_school/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:my_school/models/guist_courses.dart';
import 'package:my_school/models/subject_guest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class guestServuce {
  getclassesGuest() async {
    var url = Uri.parse(ServerConfig.DNS + ServerConfig.guist_class);
    var response = await http.get(url);
    var jsonresponse = jsonDecode(response.body);
    print(jsonresponse);
    if (jsonresponse['isOk'] == true) {
      var studentclass = classforgeust.fromJson(jsonresponse);
      return studentclass.result;
    }
  }

  getsubjectservice() async {
    var url = Uri.parse(ServerConfig.DNS + ServerConfig.guist_subject);
    var response = await http.get(url);
    var jsonrespone = jsonDecode(response.body);
    if (jsonrespone['isOk'] == true) {
      var geustsubject = subjectguset.fromJson(jsonrespone);
      print('clasess');
      return geustsubject.result;
    }
  }

  getCoursesGeust(int gradeid, int subjectid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var message;
    bool isOk;
    var code =
        prefs.getString('g' + gradeid.toString() + 's' + subjectid.toString());
    print(code);
    var Url = Uri.parse(
        ServerConfig.DNS + ServerConfig.guist_course + '?course_code=' + code!);
    var response = await http.get(
      Url,
    );
    if (response.statusCode == 200) {
      print('it is 200');
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true) {
        print('it is ok');
        isOk = true;
        var courses = guistCoursesFromJson(response.body);
        // print(courses.result[0].subject.id);
        // print(courses.result[0].grade.id);
        // gradeID = courses.result[0].grade.id;
        // subjectID = courses.result[0].subject.id;
        // print(gradeID);
        // print(subjectID);

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
