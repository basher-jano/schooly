import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/models/teacher_user.dart';
import 'package:my_school/modules/Teacher_Login/teacher_login_service.dart';

class TeacherLoginController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  var startCheck = false.obs;
  var validPhone = true.obs;
  var validPass = true.obs;

  var phone;
  var password;

  var message;
  var loginStatus;
  var userRes;

  late TeacherLoginService service;

  @override
  void onInit() {
    phone = '';
    password = '';
    message = '';
    loginStatus = false;
    service = TeacherLoginService();
    super.onInit();
  }

  Future<void> loginOnClick() async {
    // phone = phoneController.text;
    print('Tokeeeeeeeeeeeeeeeeeeeeeen');
    print(await FirebaseMessaging.instance.getToken());
    //
    password = passController.text;
    print(phone);
    TeacherUser user = TeacherUser(
      phone: phone,
      password: password,
    );

    loginStatus = await service.login(user);
    print(loginStatus);
    if (loginStatus == true) {
      message = service.message;
      userRes = service.userRes;
      print(message);
      print(userRes.result.username);
      print(UserInformation.USER_TOKEN);
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
