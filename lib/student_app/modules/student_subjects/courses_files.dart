import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/components/custem_videos.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/student_app/modules/student_subjects/courses_files_controller.dart';

class CoursesFiles extends StatelessWidget {
  var controller = Get.put(CoursesFilesController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: blueapp,
            appBar: AppBar(
              backgroundColor: white.withOpacity(0),
              elevation: 0,
              toolbarHeight: 0,
              bottom: TabBar(
                  unselectedLabelColor: white.withOpacity(0.5),
                  labelColor: white,
                  indicatorColor: white,
                  tabs: [
                    Tab(
                      text: 'Courses'.tr,
                    ),
                    Tab(
                      text: 'Files'.tr,
                    )
                  ]),
            ),
            body: TabBarView(children: [
              Container(
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
                                child: Obx(() {
                                  if (controller.isLoading == true) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  if (controller.listviedo.isEmpty) {
                                    return Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/no-results.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                        ),
                                        Text('no Videos  found !',
                                            style: TextStyle(
                                                color: Colors.blue[400],
                                                fontSize: 18.0,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.normal)),
                                      ],
                                    ));
                                  }
                                  return Container(
                                    color: Colors.white,
                                    height: MediaQuery.of(context).size.height,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      itemBuilder: (_, index) {
                                        return Obx(() {
                                          return CustemVideos(
                                            ontap: () {
                                              Get.toNamed('/student_Video',
                                                  arguments: controller
                                                      .listviedo
                                                      .value[index]
                                                      .video!);
                                            },
                                            onlongpress: () {},
                                            desc: controller.listviedo
                                                .value[index].description!,
                                          );
                                        });
                                      },
                                      itemCount:
                                          controller.listviedo.value.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: 20,
                                        );
                                      },
                                    ),
                                  );
                                })),
                          ))
                    ],
                  ),
                ),
              ),
              /**/ ///////////////////////// */
              Container(
                  //files
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
                                      horizontal: 20, vertical: 25),
                                  child: Obx(() {
                                    if (controller.isLoading == true) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (controller.StudentFilesList.isEmpty) {
                                      return Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/icons/no-results.png',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                          ),
                                          Text('no Files found !'.tr,
                                              style: TextStyle(
                                                  color: Colors.blue[400],
                                                  fontSize: 18.0,
                                                  fontFamily: 'Cairo',
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ],
                                      ));
                                    } else {
                                      return GridView.builder(
                                          itemCount: controller
                                              .StudentFilesList.length,
                                          gridDelegate:
                                              SliverGridDelegateWithMaxCrossAxisExtent(
                                                  maxCrossAxisExtent: 200,
                                                  childAspectRatio: 15 / 14,
                                                  crossAxisSpacing: 20,
                                                  mainAxisSpacing: 20),
                                          itemBuilder: (BuildContext, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                OnPdfClicked(
                                                  controller
                                                      .StudentFilesList[index]
                                                      .document,
                                                );
                                              },
                                              child: Card(
                                                elevation: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffF5F6FC),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.13,
                                                        child: Image.asset(
                                                          'assets/icons/pdf-file.png',
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.015,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.015,
                                                      ),
                                                      Center(
                                                          child: Text(
                                                        controller
                                                            .StudentFilesList[
                                                                index]
                                                            .description,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Cairo'),
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  })),
                            ))
                      ],
                    ),
                  ))

              /************************************* */
            ])));
  }

  OnPdfClicked(String? url) {
    controller.openFile(
      url: url,
      fileName: 'name.pdf',
    );
  }
}
