import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_school/config/server_config.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/models/student_notes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentNotesService {
  Future<List<Result>> StudentNotes() async {
    var url = Uri.parse(ServerConfig.DNS + ServerConfig.my_notes);

    var response = await http.get(
      url,
      headers: {
        "Authorization": 'Bearer ${UserInformation.STUDENT_TOKEN}',
        'Accept': 'application/json'
      },
    );
    print(response.statusCode);
    print('Subject: ${response.body}');
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true) {
        var result = jsonResponse['result'];

        var subject = subjectNotesFromJson(response.body);

        return subject.result;
      } else
        return [];
    } else
      return [];
  }

  
  sendnotes(note) async {
    var url = Uri.parse(ServerConfig.DNS + ServerConfig.send_note + '${note}');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await http.post(
      url,
      headers: {
        "Authorization": 'Bearer ${UserInformation.STUDENT_TOKEN}',
        'Accept': 'application/json'
      },
    );

  }
}
