import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_school/config/server_config.dart';
import 'package:my_school/config/user_information.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/student_notification_model.dart';

class TeacherNotificationService {
  Future<void> update_fir_token(fcm) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse(ServerConfig.DNS + ServerConfig.update_fir_token);

    var response = await http.post(
      url,
      headers: {
        "Authorization": 'Bearer ${prefs.getString('token')}',
        'Accept': 'application/json'
      },
      body: {"newToken": fcm},
    );
    print(' ******status code :  ${response.statusCode}');
    print(' ******response.body :  ${response.body}');
  }

  Future<List<Result>> TeacherNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse(ServerConfig.DNS + ServerConfig.user_notification);

    var response = await http.get(
      url,
      headers: {
        "Authorization": 'Bearer ${prefs.getString('token')}',
        'Accept': 'application/json'
      },
    );
    print(response.statusCode);
    print('Notification: ${response.body}');

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true) {
        var result = jsonResponse['result'];

        var subject = studentNotificationFromJson(response.body);

        return subject.result;
      } else
        return [];
    } else
      return [];
  }
}
