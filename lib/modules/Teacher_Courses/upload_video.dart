import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/Teacher_Courses/upload_video_controler.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;

class UploadVideo extends StatelessWidget {
  UploadVideoController controller = Get.find();
  final t =
      'AAAA3cDsRks:APA91bHrOYJbl90mBRv71g6k1J-2-NsAIJyszMVr28ui6cu8bsXEL_ovAMs-zVj1tTqsDW_1Fo4d9lEZeqDdY9dxr4DQWnJic9gxT90qk3jEz78mDtGwZyxNTgeSRzynuDNAOiVkWmIk';
  @override
  void onClickUploded() async {
    EasyLoading.show(status: 'loading'.tr);

    if (controller.isselected && controller.isUpload.value) {
      await controller.UploadVideoservice();
      if (controller.isuploded == true) {
        EasyLoading.showSuccess('Video Uploded successfully'.tr);
        controller.isUpload.value = false;
        controller.isselected = false;
        controller.decriptionController.text = '';
        controller.decriptionControlleren.text = '';
        await http.post(
            Uri.parse('https://fcm.googleapis.com/fcm/send'),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization': 'key=$t',
            },
            body: jsonEncode(
              <String, dynamic>{
                'notification': <String, dynamic>{
                  'body': 'this is aanwar',
                  'title': 'this is a title'
                },
                'priority': 'high',
                'data': <String, dynamic>{
                  'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                  'id': '1',
                  'status': 'done'
                },
                'to': "/topics/anwar"
              },
            ),
          );

      } else {
        EasyLoading.showError('Uploaded failed'.tr);
      }
    } else if (controller.isselected == false ||
        controller.isUpload.value == false) {
      if (controller.isUpload.value == false &&
          controller.isselected == false) {
        EasyLoading.showError('please choose class and file'.tr);
      } else if (controller.isselected == false) {
        EasyLoading.showError('You Should select class'.tr);
      } else if (controller.isUpload.value == false) {
        EasyLoading.showError('You Should pick file '.tr);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff7292CF),
                Color(0xff6688CA),
                Color(0xff476FBC),
                Color(0xff2855AE)
              ]),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/flowers_up.png'),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 25),
                        child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  DropdownSearch<String>(
                                    mode: Mode.MENU,
                                    showSelectedItems: true,
                                    items: controller.List_name,
                                    hint: "valid clases ".tr,
                                    popupItemDisabled: (String s) =>
                                        s.startsWith('I'),
                                    onChanged: (value) {
                                      controller.class_name = value;
                                      print(controller.class_name);
                                      controller.take_id();
                                      controller.isselected = true;
                                    },
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                  Obx(() {
                                    return GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue[200],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Center(
                                            child: controller.isUpload.value ==
                                                    false
                                                ? Text(
                                                    'Click to explore Video'.tr,
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.02),
                                                  )
                                                : Text(
                                                    'Video is picked'.tr,
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.02),
                                                  )),
                                      ),
                                      onTap: () {
                                        controller.openFileExplorer();
                                      },
                                    );
                                  }),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                  Column(
                                    children: [
                                      TextFormField(
                                          onChanged: ((value) {
                                            controller.isdesc.value = true;
                                            print(controller.isdesc.value);
                                          }),
                                          controller:
                                              controller.decriptionController,
                                          maxLines: 5,
                                          decoration: InputDecoration(
                                            hintText: 'Arabic Description'.tr,
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: Colors.amber,
                                              width: 1,
                                            )),
                                          )),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      TextFormField(
                                         
                                          controller:
                                              controller.decriptionControlleren,
                                          maxLines: 5,
                                          decoration: InputDecoration(
                                            hintText: 'English Description'.tr,
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: Colors.amber,
                                              width: 1,
                                            )),
                                          )),
                                     
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue[200],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          child: Center(
                                              child: Text(
                                            "Upload".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.normal,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02),
                                          )),
                                        ),
                                        onTap: () {
                                          onClickUploded();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
 /*Obx(() {
            return ElevatedButton(
                onPressed: () {
                  controller.openFileExplorer();
                },
                child: controller.isUpload.value == false
                    ? Text('click to explor file')
                    : Text('File is pick'));
          })*/