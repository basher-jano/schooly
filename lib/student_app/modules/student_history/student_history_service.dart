import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:my_school/config/user_information.dart';
import 'package:my_school/models/student_evaloation.dart';
import 'package:my_school/models/student_marks.dart';

class StudentHistoryService {
  var evUrl = Uri.parse(ServerConfig.DNS + ServerConfig.studentevaloations);
  var evResult;
  var evaloation_list;

  Future evaloations() async {
    var evResponse = await http.get(
      evUrl,
      headers: {
        "Authorization": 'Bearer ${UserInformation.STUDENT_TOKEN}',
      },
    );
    print(' status code :  ${evResponse.statusCode}');
    // print(evResponse.body);

    if (evResponse.statusCode == 200) {
      var jsonResponse = jsonDecode(evResponse.body);
      if (jsonResponse['isOk'] == true) {
        evResult = jsonResponse['result'];
        evaloation_list = studentEvaloationsFromJson(evResponse.body);

        return evaloation_list.result;
      } else if (evResponse.statusCode == 500) {
        Get.toNamed('loginas');
        Get.defaultDialog(
            titleStyle: TextStyle(fontFamily: 'Cairo'),
            title: 'انتهت صلاحية الجسلة',
            content: Text(
              'الرجاء معاودة تسجيل الدخول ',
              style: TextStyle(fontFamily: 'Cairo'),
            ));
      } else
        return [];
    }
  }

  marks() async {
    var url = Uri.parse(ServerConfig.DNS + ServerConfig.studentmarks);
    var response = await http.get(url, headers: {
      "Authorization": 'Bearer ${UserInformation.STUDENT_TOKEN}',
    });
    var jsonresponse = jsonDecode(response.body);

    if (jsonresponse['isOk'] == true) {
      var studentmark = mark.fromJson(jsonresponse);
      print('ojjjjjjjjjjjjjjjj');

      return studentmark.result;
    }
  }
}
