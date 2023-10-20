import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_school/config/server_config.dart';
import 'package:my_school/models/class_student_model.dart';
import 'package:my_school/modules/Student/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassesService {
  Future<List<Result>> StudentClasses(id) async {
    var url =
        Uri.parse(ServerConfig.DNS + ServerConfig.class_studens + '${id}');
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
        'Accept': 'application/json'
      },
    );

    // print(' status code :  ${response.statusCode}');
    // print(response.body);
/////////////////////////////////////////////////
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true) {
        var result = jsonResponse['result'];
        var students = classStudensFromJson(response.body);
          // print(' ssssstttttttuuuuuddddeeeeennnntttt :  ${students.result}');

   

        return students.result;
      } else
        return [];
    } else
      return [];
  }
}
