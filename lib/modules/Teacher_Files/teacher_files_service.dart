import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:my_school/config/server_config.dart';
import 'package:my_school/models/teacher_files_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TeacherFilesService {
  

  
  Future<List<Result>> teacherFiles() async {
     var url = Uri.parse(ServerConfig.DNS + ServerConfig.teacher_documents);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
        'Accept': 'application/json'
      
      },
    );


    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true) {
      var  result = jsonResponse['result'];
     
     var   files = teacherFilesFromJson(response.body);
     
        return files.result;
      } else
        return [];
    } else
      return [];
  }
 var message;
Future<bool> deletFiles(id) async {
 var url2 = Uri.parse(ServerConfig.DNS + ServerConfig.delete_file+'${id}');
    SharedPreferences prefs = await SharedPreferences.getInstance();

 var response = await http.delete(
      url2,
      headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
        'Accept': 'application/json'
      
      },
    );

print(response.statusCode);
print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true) {
       message = jsonResponse['result'];
     
     
        return true;
      } else
        return false;
    } else
      return false;

}




}
