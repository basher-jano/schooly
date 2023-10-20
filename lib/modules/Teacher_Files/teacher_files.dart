import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/Teacher_Files/teacher_files_controller.dart';
import 'package:my_school/modules/Teacher_Upload_File/Teacher_upload_file.dart';

class TeacherFilesPage extends StatelessWidget {
  var controller = Get.put(TeacherFilesPageController());

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
                          height: MediaQuery.of(context).size.height * 0.73,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 25),
                              child: GetBuilder<TeacherFilesPageController>(
                                init: TeacherFilesPageController(),
                                builder: (controller) {
                                  return RefreshIndicator(
                                    displacement: 250,
                                    backgroundColor: white,
                                    color: Colors.black,
                                    strokeWidth: 3,
                                    triggerMode:
                                        RefreshIndicatorTriggerMode.onEdge,
                                    child: Obx(() {
                                      if (controller.isLoading == true) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      } else {
                                        return GridView.builder(
                                            itemCount:
                                                controller.ListFiles.length,
                                            gridDelegate:
                                                SliverGridDelegateWithMaxCrossAxisExtent(
                                                    maxCrossAxisExtent: 200,
                                                    childAspectRatio: 15 / 14,
                                                    crossAxisSpacing: 20,
                                                    mainAxisSpacing: 20),
                                            itemBuilder: (BuildContext, index) {
                                              return GestureDetector(
                                                onLongPress: () {
                                                  Get.defaultDialog(
                                                    title: 'Delete the file :',
                                                    content: GestureDetector(
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5))),
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
                                                            'Delete',
                                                            style: TextStyle(
                                                                color: white,
                                                                fontFamily:
                                                                    'Cairo',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.02),
                                                          )),
                                                        ),
                                                        onTap: () {
                                                          print(
                                                              'controller.ListFiles[$index].id${controller.ListFiles[index].id}');
                                                          controller
                                                              .OnDeleteClicked(
                                                                  controller
                                                                      .ListFiles[
                                                                          index]
                                                                      .id);
                                                          Get.close(1);
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'File has deleted Successfully',
                                                              backgroundColor:
                                                                  Color(
                                                                      0xff6688CA),
                                                              gravity:
                                                                  ToastGravity
                                                                      .CENTER);
                                                        }),
                                                  );
                                                },
                                                onTap: () {
                                                  OnPdfClicked(
                                                    controller.ListFiles[index]
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
                                                              .spaceEvenly,
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          child: Image.asset(
                                                            'assets/images/pdf.png',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Center(
                                                            child: Text(
                                                          controller
                                                              .ListFiles[index]
                                                              .description,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'Cairo',
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.02),
                                                        ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      }
                                    }),
                                    onRefresh: () async {
                                      await controller.service.teacherFiles();
                                    },
                                  );
                                },
                              )),
                        ))
                  ],
                ),
              ))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: blueapp,
        onPressed: () {
          Get.to(TeacherUploadFile());
        },
      ),
    );
  }

  OnPdfClicked(String? url) {
    controller.openFile(
      url: url,
      //url: 'http://www.africau.edu/images/default/sample.pdf',
      fileName: 'name.pdf',
    );
  }
}
