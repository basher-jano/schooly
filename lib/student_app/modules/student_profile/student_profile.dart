import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/components/Nav_Bar.dart';
import 'package:my_school/components/info_list.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/Teacher_Profile/teacher_profile_controller.dart';
import 'package:my_school/student_app/modules/student_profile/student_profile_controller.dart';

class StudentProfile extends StatelessWidget {
  var controller = Get.put(StudentProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(gradient: background),
            child: Stack(
              children: [
                Image.asset('assets/images/flowers_up.png'),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Image.network(
                                  // UserInformation.STUDENT_AVATAR,
                                  UserInformation.STUDENT_AVATAR,
                                  width:
                                      MediaQuery.of(context).size.height * 0.11,
                                  height:
                                      MediaQuery.of(context).size.height * 0.11,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.03),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      UserInformation.STUDENT_NAME,
                                      style: TextStyle(
                                          color: black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025),
                                    ),
                                    Text(
                                      UserInformation.STUDENT_EMAIL,
                                      style: TextStyle(
                                          color: black.withAlpha(120),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        infoList(
                            title: 'phone'.tr,
                            content: UserInformation.STUDENT_PHONE),
                        Divider(
                          height: 1,
                          color: black.withAlpha(100),
                        ),
                        infoList(
                            title: 'address'.tr,
                            content: UserInformation.STUDENT_ADDRESS),
                        Divider(
                          height: 1,
                          color: black.withAlpha(100),
                        ),
                        infoList(
                            title: 'avg'.tr,
                            content: UserInformation.STUDENT_AVG.toString()),
                        Divider(
                          height: 1,
                          color: black.withAlpha(100),
                        ),
                        infoList(
                            title: 'attendancerate'.tr,
                            content: UserInformation.STUDENT_ATTENDANCE_RATE
                                .toString()),
                        Divider(
                          height: 1,
                          color: black.withAlpha(100),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        drawer: Drawer(
            child: SafeArea(
                child: Container(
          child: Center(
              child: Text(
            'Teacher Drawer',
            style: TextStyle(fontSize: 30),
          )),
        ))));
  }
}
