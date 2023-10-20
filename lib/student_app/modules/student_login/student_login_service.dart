import 'dart:convert';

import 'package:my_school/config/server_config.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/models/student_user.dart';
import 'package:http/http.dart' as http;
import 'package:my_school/models/student_user_res.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentLoginService {
  var result;
  var token;
  var userRes;
  var message;
  var lang;
  var url = Uri.parse(ServerConfig.DNS + ServerConfig.studentlogin);

  Future<bool> login(StudentUser user) async {
    print(user.phone);
    print(user.password);
    var response = await http.post(
      url,
      body: {
        'phone': user.phone,
        'password': user.password,
      },
    );

    print(' status code :  ${response.statusCode}');
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true && jsonResponse['token'] != null) {
        result = jsonResponse['result'];
        // print(result);
        token = jsonResponse['token'];
        userRes = studentUserResFromJson(response.body);

        // print('avg: ${userRes.result.avg}');

        // print(token);
        print('aavvvvaaaaattaaarrrrrrrrrrrrrr');
        print('student avaaataaarrrr: ${userRes.result.avatar}');

        UserInformation.STUDENT_TOKEN = token;
        UserInformation.STUDENT_AVATAR = userRes.result.avatar;
        UserInformation.STUDENT_ID = userRes.result.id.toString();
        UserInformation.STUDENT_NAME = userRes.result.name;
        UserInformation.STUDENT_EMAIL = userRes.result.email;
        UserInformation.STUDENT_PHONE = userRes.result.phone;
        UserInformation.STUDENT_AVATAR = userRes.result.avatar;
        UserInformation.STUDENT_ADDRESS = userRes.result.address ?? '';
        UserInformation.STUDENT_AVG = userRes.result.avg;
        UserInformation.STUDENT_ATTENDANCE_RATE = userRes.result.attendanceRate;

        print(UserInformation.STUDENT_NAME);
        print(UserInformation.STUDENT_PHONE);
        print(UserInformation.STUDENT_ID);
        print(UserInformation.STUDENT_AVG);
        print(UserInformation.STUDENT_ATTENDANCE_RATE);

        // save token to device

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('student_token', UserInformation.STUDENT_TOKEN);
        prefs.setString('student_username', UserInformation.STUDENT_NAME);
        prefs.setString('student_avatar', UserInformation.STUDENT_AVATAR);
        prefs.setString('student_id', UserInformation.STUDENT_ID);
        prefs.setString('student_address', UserInformation.STUDENT_ADDRESS);
        prefs.setString('student_phone', UserInformation.STUDENT_PHONE);
        prefs.setString('student_email', UserInformation.STUDENT_EMAIL);
        prefs.setDouble('student_avg', UserInformation.STUDENT_AVG);
        prefs.setString('student_avatar', UserInformation.STUDENT_AVATAR);

        prefs.setInt(
            'student_attendance_rate', UserInformation.STUDENT_ATTENDANCE_RATE);

        print(UserInformation.LANG);

        changeLang();
        return true;
      } else if (jsonResponse['isOk'] == false) {
        var jsonResponse = jsonDecode(response.body);
        message = jsonResponse['message'];
        print(message);

        return false;
      } else {
        return false;
      }
    } else if (response.statusCode == 302) {
      print('error');
      print(response.body);
      return false;
    } else if (response.statusCode == 422) {
      print('error');
      print(response.body);
      return false;
    } else
      return false;
  }

  var langUrl = UserInformation.LANG == 'العربية'
      ? Uri.parse(
          ServerConfig.DNS + ServerConfig.studentchangeLang + '?Language=ar')
      : Uri.parse(
          ServerConfig.DNS + ServerConfig.studentchangeLang + '?Language=en');
  Future changeLang() async {
    print(langUrl);
    var langResponse = await http.get(langUrl, headers: {
      "Authorization": 'Bearer ${UserInformation.STUDENT_TOKEN}',
    });
    print(' lang status code ${langResponse.statusCode}');
    print(langResponse.body);
  }
}
