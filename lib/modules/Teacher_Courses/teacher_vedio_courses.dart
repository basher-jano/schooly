import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/components/custem_videos.dart';
import 'package:my_school/components/custom_button.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/Teacher_Courses/teacher_video_controller.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

class TeacherVideos extends StatelessWidget {
  TeacherVideosController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: blueapp,
          onPressed: () {
            Get.toNamed('/uploadVideo');
          },
        ),
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
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: Container(
                                color: Colors.white,
                                height: MediaQuery.of(context).size.height,
                                child: Obx(() {
                                  return RefreshIndicator(
                                    displacement: 250,
                                    backgroundColor: Colors.white,
                                    color: blueapp,
                                    strokeWidth: 3,
                                    triggerMode:
                                        RefreshIndicatorTriggerMode.anywhere,
                                    onRefresh: () async {
                                      controller.refresh();
                                    },
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                      itemCount: controller.list_des.length,
                                      physics: const ClampingScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return CustemVideos(
                                        
                                          desc: controller.list_des[index]
                                              .toString(),
                                          ontap: () {
                                            Get.toNamed('/video', arguments: [
                                              controller.list_video_id[index]
                                            ]);
                                          },
                                          onlongpress: () {
                                            Get.defaultDialog(
                                                title:
                                                    'Do You want to delete this video?'.tr,
                                                content: Center(
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.11,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                       
                                                        GestureDetector(
                                                          child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Color.fromARGB(255, 231, 103, 103),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(5))),
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.4,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.05,
                                                                child: Center(
                                                                    child: Text(
                                                                  "Delete".tr,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontSize: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.02),
                                                                )),
                                                              ),
                                                        onTap: () async {
                                                            
                                                              controller.DeleteVideoServuce(
                                                                  controller
                                                                          .list_video_id[
                                                                      index]);
                                                              Get.close(1);
                                                            },
                                                        
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                          },
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(height: 10);
                                      },
                                    ),
                                  );
                                }),
                              ))))
                ],
              ),
            ),
          ),
        ));
  }
}
