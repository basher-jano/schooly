import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_school/components/custom_login_textfield.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/student_app/modules/student_notes/student_notes_controller.dart';

class StudentNotes extends StatelessWidget {
  StudentNotes({Key? key}) : super(key: key);
  var controller = Get.put(StudentNotesController());
  var note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/flowers_up.png'),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      left: MediaQuery.of(context).size.height * 0.02,
                      right: MediaQuery.of(context).size.height * 0.02,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.008),
                        child: Obx(() {
                          if (controller.isLoading == true) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  child: Card(
                                      elevation: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffF5F6FC),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                                0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Center(
                                                    child: Text(
                                                        controller
                                                            .NotesList[index]
                                                            .note,
                                                        style: TextStyle(
                                                          color:
                                                              Colors.blue[200],
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.020,
                                                          fontFamily: "Cairo",
                                                        ))),
                                                Text("5/7/2022",
                                                    style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 79, 102, 121),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.015,
                                                      fontFamily: "Cairo",
                                                    ))
                                              ],
                                            )),
                                      )),
                                );
                              },
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 10);
                              },
                              itemCount: controller.NotesList.length,
                            );
                          }
                        }))),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Get.defaultDialog(
            title: 'typenote'.tr,
            content: Column(
              children: [
                Column(
                  children: [
                    CustemLoginTextField(
                      hieght: 68,
                      width: MediaQuery.of(context).size.width * 0.95,
                      hintText: '',
                      onchanged: (value) {
                        note = value;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Center(
                        child: Text(
                      "send".tr,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    )),
                  ),
                  onTap: () async {
                    if (note == null) {
                      Fluttertoast.showToast(
                        msg: 'The note cant be empty',
                        backgroundColor: Color(0xff6688CA),
                      );
                    } else {
                      var type = 2;
                      controller.onTapSend(note);
                      Get.close(1);
                      EasyLoading.showSuccess("The note send succesfully!",
                          dismissOnTap: true);
                    }
                  },
                ),
              ],
            ),
          );
        }),

        child: Image.asset(
          'assets/icons/send.png',
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.25,
        ),

        elevation: 0,
        backgroundColor: Colors.transparent,
        //     elevation: 0,
      ),
    );
  }
}
