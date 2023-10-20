import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/models/student_user.dart';
import 'package:my_school/student_app/modules/student_login/student_login_service.dart';
import 'package:my_school/student_app/notifcations/listen_on_notifcations.dart';

class StudentLoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var startCheck = false.obs;
  var validPhone = true.obs;
  var validPass = true.obs;

  var phone;
  var password;

  var message;
  var loginStatus;
  var userRes;

  late StudentLoginService service;

  @override
  void onInit() {
    phone = '';
    password = '';
    message = '';
    loginStatus = false;
    service = StudentLoginService();
    super.onInit();
  }

  Future<void> loginOnClick() async {
   
    // phone = phoneController.text;
    password = passController.text;
    print(phone);
    StudentUser user = StudentUser(
      phone: phone,
      password: password,
    );

    loginStatus = await service.login(user);
    print(loginStatus);
    if (loginStatus == true) {
      message = service.message;
      userRes = service.userRes;
      print(message);
      print(userRes.result.name);
      print(UserInformation.STUDENT_TOKEN);
    }

    // if (message is List) {
    //   String temp = '';
    //   for (String s in message) {
    //     temp += s + '\n';
    //     message = temp;
    //   }
    // }
  }
}
