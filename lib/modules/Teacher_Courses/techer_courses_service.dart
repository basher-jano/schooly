import 'package:http/http.dart' as http;
import 'package:my_school/config/server_config.dart';
import 'package:my_school/models/techer_video_model.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class TeacherCoursesService {
  getVideo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse(ServerConfig.DNS + ServerConfig.Teachervideos);
    var response = await http.get(url, headers: {
      'Authorization': ' Bearer ${prefs.getString('token')}',
      'Accept': 'application/json'
    });

    var jesonresponse = jsonDecode(response.body);
    print(response.body);
    if (jesonresponse['isOk'] == true) {
      var videoteacher = TeachervideModle.fromJson(jesonresponse);
      print(videoteacher.result);
      return videoteacher.result;
    }
  }

  deletVideo(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse(ServerConfig.DNS + ServerConfig.delete + id.toString());
    var response = await http.delete(url, headers: {
      'Authorization': ' Bearer ${prefs.getString('token')}',
      'Accept': 'application/json'
    });
  }
}
