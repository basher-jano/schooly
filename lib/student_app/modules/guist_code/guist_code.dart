import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_school/components/custom_button.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/student_app/modules/guist_code/guist_code_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class GuistCode extends StatelessWidget {
  GuistCodeController controller = Get.find();
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: Text(
                    'pleaseentercode'.tr,
                    style: TextStyle(
                      color: black,
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: Form(
                      child: PinCodeTextField(
                    cursorColor: blueapp,
                    pinTheme: PinTheme(
                        activeColor: blueapp,
                        inactiveColor: black,
                        selectedColor: black.withOpacity(0.5)),
                    length: 6,
                    appContext: context,
                    onChanged: (value) {
                      controller.code = value;
                      if (controller.code != null &&
                          controller.code.length == 6) {
                        controller.validCode.value = true;
                      }
                    },
                  )),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: Obx(
                      () => controller.validCode.value == true
                          ? Container()
                          : Text(
                              'codeshldbe6char'.tr,
                              style: const TextStyle(color: red),
                            ),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                        width: MediaQuery.of(context).size.width * 0.9,
                        hieght: MediaQuery.of(context).size.height * 0.08,
                        ontap: () {
                          if (controller.code == null) {
                            print('no');
                            controller.validCode.value = false;
                          } else if (controller.code.length < 6) {
                            print('no');
                            controller.validCode.value = false;
                          } else {
                            controller.validCode.value = true;
                            sendCode();
                          }
                        },
                        ButtonName: 'send'.tr),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void sendCode() async {
    await controller.sendCode();
    EasyLoading.show();
    if (controller.isOk == true) {
      EasyLoading.showSuccess((controller.message).tr);
    } else {
      EasyLoading.showError((controller.message).tr);
    }
  }
}
