import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_school/config/server_config.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/models/student_Ads_files.dart';
import 'package:my_school/models/teacher_ads.dart';

class StudentHomePageService {
  var url = Uri.parse(ServerConfig.DNS + ServerConfig.studentAds);
  var result;
  var ads;
  Future studentAds() async {
    var response = await http.get(
      url,
      headers: {
        "Authorization": 'Bearer ${UserInformation.STUDENT_TOKEN}',
      },
    );

    print('home status code :  ${response.statusCode}');
    print('*****************+${response.body}');

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true) {
        result = jsonResponse['result'];
        // print(result);
        ads = adsFromJson(response.body);
        // print(ads.result[0].content);
        return ads.result;
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

StudentAdsFiles() async {
    var url =
        Uri.parse(ServerConfig.DNS + ServerConfig.student_Ads_file);

    var response = await http.get(
      url,
      headers: {
        "Authorization": 'Bearer ${UserInformation.STUDENT_TOKEN}',
        'Accept': 'application/json'
      },
    );

    print(response.statusCode);
    print('Student_Ads_Files: ${response.body}');
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true) {
        var Ads_files = studentAdsFilesFromJson(response.body);

        return Ads_files.result;
      } else
        return [];
    } else
      return [];
  }


}
