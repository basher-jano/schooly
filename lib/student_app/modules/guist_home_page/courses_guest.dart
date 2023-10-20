import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/components/custem_videos.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/student_app/modules/guist_home_page/courses_guest_controller.dart';

class GeustCourses extends StatelessWidget {
  CoursesController controller = Get.find();
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
                                onRefresh: () async {},
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.Courseslist.value.length,
                                  physics: const ClampingScrollPhysics(),
                                  itemBuilder: (BuildContext context, index) {
                                    return CustemVideos(
                                      desc: controller
                                          .Courseslist[index].description
                                          .toString(),
                                      ontap: () {
                                        Get.toNamed('/guist_Video', arguments: [
                                          controller.Courseslist[index].video
                                        ]);
                                      },
                                      onlongpress: () {},
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
