import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/components/custom_button.dart';
import 'package:my_school/components/custom_login_textfield.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/Teacher_Login/teacher_login_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class TeacherLogin extends StatelessWidget {
  TeacherLoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: background,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.06),
          child: Image.asset('assets/images/background.png'),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    children: [
                      Text(
                        'hi'.tr,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      Text(
                        ' ' + 'teacher'.tr,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    children: [
                      Text(
                        'signintocontinue'.tr,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustemLoginTextField(
                        hieght: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.95,
                        hintText: 'phone'.tr,
                        controller: controller.phoneController,
                        keyboard: TextInputType.phone,
                        onchanged: (value) {
                          controller.phone = value;
                          if (controller.startCheck.value == true &&
                              (controller.phone == '' ||
                                  controller.phone == null ||
                                  controller.phone.length < 10)) {
                            controller.validPhone.value = false;
                            // Get.defaultDialog(
                            //     title: 'invalidinput'.tr,
                            //     content: Text('invalidphonenumber'.tr));
                          } else {
                            controller.validPhone.value = true;
                          }
                          print(controller.phone);
                        },
                      ),
                      Row(
                        children: [
                          Obx(
                            () => controller.validPhone.value == false
                                ? Text(
                                    'invalidphonenumber'.tr,
                                    style: TextStyle(color: red),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      CustemLoginTextField(
                        hieght: MediaQuery.of(context).size.height * 0.09,
                        width: MediaQuery.of(context).size.width * 0.95,
                        hintText: 'pass'.tr,
                        controller: controller.passController,
                        keyboard: TextInputType.visiblePassword,
                        onchanged: (value) {
                          controller.password = value;
                          if (controller.password == '' ||
                              controller.password == null ||
                              controller.password.length < 8) {
                            controller.validPass.value = false;
                            // Get.defaultDialog(
                            //     title: 'invalidinput'.tr,
                            //     content: Text('passshouldbe8'.tr));
                          } else {
                            controller.validPass.value = true;
                          }
                          print(controller.password);
                        },
                      ),
                      Row(
                        children: [
                          Obx(
                            () => controller.validPass.value == false
                                ? Text(
                                    'passshouldbe8'.tr,
                                    style: TextStyle(color: red),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      CustomButton(
                        width: MediaQuery.of(context).size.width * 0.80,
                        hieght: MediaQuery.of(context).size.height * 0.08,
                        ButtonColor: Colors.white70,
                        ontap: () async {
                          controller.startCheck.value = true;
                          if (controller.phone == '' ||
                              controller.phone == null ||
                              controller.phone.length < 10) {
                            controller.validPhone.value = false;
                            // Get.defaultDialog(
                            //     title: 'invalidinput'.tr,
                            //     content: Text('invalidphonenumber'.tr));
                          } else if (controller.password == '' ||
                              controller.password == null ||
                              controller.password.length < 8) {
                            controller.validPass.value = false;
                            // Get.defaultDialog(
                            //     title: 'invalidinput'.tr,
                            //     content: Text('passshouldbe8'.tr));
                          } else {
                            onClicklogin();
                          }
                        },
                        ButtonName: 'login'.tr,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void onClicklogin() async {
    EasyLoading.show(status: 'loading'.tr);
    await controller.loginOnClick();
    if (controller.loginStatus == true) {
      EasyLoading.showSuccess('signgsucces'.tr);
      await Get.offAllNamed('/techermainpage');
    } else {
      EasyLoading.showError('wrongphoneorpass'.tr);
    }
  }
}
