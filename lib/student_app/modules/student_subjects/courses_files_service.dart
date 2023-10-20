import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_school/config/server_config.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/models/student_sub_files_models.dart';
import 'package:my_school/models/student_video.dart';
import 'package:my_school/models/techer_video_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentCoursesFilesService {
  StudentFiles(id) async {
    var url =
        Uri.parse(ServerConfig.DNS + ServerConfig.documents_list + '${id}');

    var response = await http.get(
      url,
      headers: {
        "Authorization": 'Bearer ${UserInformation.STUDENT_TOKEN}',
        'Accept': 'application/json'
      },
    );

    print(response.statusCode);
    print('Student_Files: ${response.body}');
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true) {
        var files = subjectFilesFromJson(response.body);

        return files.result;
      } else
        return [];
    } else
      return [];
  }

  getVideo(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse(
        ServerConfig.DNS + ServerConfig.getStudent_video + id.toString());
    var response = await http.get(url, headers: {
      'Authorization': ' Bearer ${UserInformation.STUDENT_TOKEN}',
      'Accept': 'application/json'
    });

    var jesonresponse = jsonDecode(response.body);

    if (jesonresponse['isOk'] == true) {
      var videoteacher = videosstudent.fromJson(jesonresponse);
      print('______________________________');

      return videoteacher.result;
    }
  }
}
