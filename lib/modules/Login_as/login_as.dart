import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/components/custem_textfiled.dart';
import 'package:my_school/components/custom_button.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/login_as/login_as_controller.dart';

import '../../components/custom_choose_type.dart';

class loginAs extends StatelessWidget {
  loginAsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: background as Color,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: background),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.17,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'welcome'.tr,
                    style: TextStyle(
                      color: white,
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  Text(
                    'pleaschoospurposes'.tr + ' :',
                    style: TextStyle(
                      color: white,
                      fontSize: MediaQuery.of(context).size.height * 0.027,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customChooseType(
                      type: 'teacher'.tr,
                      pic: 'assets/icons/teacher.png',
                      onTab: () {
                        Get.toNamed('teacherlogin');
                      }),
                  customChooseType(
                    type: 'student'.tr,
                    pic: 'assets/icons/student.png',
                    onTab: () {
                      Get.toNamed('studentlogin');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.225,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/flowers.png'),
            )
          ],
        ),
      ),
    );
  }
}
