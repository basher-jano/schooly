import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_school/config/server_config.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/models/teacher_user.dart';
import 'package:my_school/models/teacher_user_res.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherLoginService {
  var result;
  var token;
  var userRes;
  var message;
  var lang;
  var url = Uri.parse(ServerConfig.DNS + ServerConfig.login);

  Future<bool> login(TeacherUser user) async {
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
        userRes = teacherUserResFromJson(response.body);
        // print(token);
        print('aavvaattaarr: ${userRes.result.avatar}');

        UserInformation.USER_TOKEN = token;
        UserInformation.USER_ID = userRes.result.id.toString();
        UserInformation.USER_NAME = userRes.result.username;
        UserInformation.USER_EMAIL = userRes.result.email;
        UserInformation.USER_PHONE = userRes.result.phone;
        UserInformation.TEACHER_AVATAR = userRes.result.avatar;
        UserInformation.USER_ADDRESS = userRes.result.address ?? '';

        // save token to device

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', UserInformation.USER_TOKEN);
        prefs.setString('username', UserInformation.USER_NAME);
        prefs.setString('id', UserInformation.USER_ID);
        prefs.setString('address', UserInformation.USER_ADDRESS);
        prefs.setString('phone', UserInformation.USER_PHONE);
        prefs.setString('email', UserInformation.USER_EMAIL);
        prefs.setString('teacher_avatar', UserInformation.TEACHER_AVATAR);

        print(UserInformation.LANG);

        changeLang();
        return true;
      } else if (jsonResponse['isOk'] == false) {
        var jsonResponse = jsonDecode(response.body);
        message = jsonResponse['message'];

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
      ? Uri.parse(ServerConfig.DNS + ServerConfig.changeLang + '?Language=ar')
      : Uri.parse(ServerConfig.DNS + ServerConfig.changeLang + '?Language=en');
  Future changeLang() async {
    print(langUrl);
    var langResponse = await http.get(langUrl, headers: {
      "Authorization": 'Bearer ${UserInformation.USER_TOKEN}',
    });
    print(' lang status code ${langResponse.statusCode}');
    print(langResponse.body);
  }
}
