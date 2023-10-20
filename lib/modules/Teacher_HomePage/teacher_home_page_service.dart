import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_school/config/server_config.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/models/teacher_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherHomePageService {
  var url = Uri.parse(ServerConfig.DNS + ServerConfig.teacherAds);
  var result;
  var ads;
  Future teacherAds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await http.get(
      url,
      headers: {
        "Authorization": 'Bearer ${prefs.getString('token')}',
      },
    );

    // print(' status code :  ${response.statusCode}');
    // print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true) {
        result = jsonResponse['result'];
        // print(result);
        ads = adsFromJson(response.body);
        // print(ads.result[0].content);

        return ads;
      } else
        return [];
    } else if (response.statusCode == 500) {
      Get.toNamed('loginas');
      Get.defaultDialog(
          titleStyle: const TextStyle(fontFamily: 'Cairo'),
          title: 'انتهت صلاحية الجسلة',
          content: const Text(
            'الرجاء معاودة تسجيل الدخول ',
            style: TextStyle(fontFamily: 'Cairo'),
          ));
    } else
      return [];
  }
}
