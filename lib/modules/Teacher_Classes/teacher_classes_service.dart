import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:my_school/config/server_config.dart';
import 'package:my_school/models/teacher_classes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TeacherClassesService {
  

  
  Future<List<Class>> teacherClasses() async {
     var url = Uri.parse(ServerConfig.DNS + ServerConfig.teacher_classes);
    SharedPreferences prefs = await SharedPreferences.getInstance();
var token=prefs.getString('token');
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Accept': 'application/json'
      
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true) {
      var  result = jsonResponse['result'];
     
     var   classes = teacherClassesFromJson(response.body);
     
        return classes.result.classes;
      } else
        return [];
    } else
      return [];
  }
}
