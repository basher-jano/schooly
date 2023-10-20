import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_school/components/custom_login_textfield.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/Student/student_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Student extends StatelessWidget {
  var controller = Get.put(StudentController());
  var evaluation;
  var appdesc;
  var wardesc;

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
                            MediaQuery.of(context).size.height * 0.01),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(controller.avatar),
                                    radius: MediaQuery.of(context).size.height *
                                        0.06,
                                  ),
                                  Container(
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
                                        color: Colors.blue[200],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              0.013),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Name".tr + ' : ',
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.025,
                                              color: white,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            controller.StudentList2.name,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.025,
                                                color: Colors.greenAccent,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Image.asset(
                                      'assets/icons/three_points.png',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                      color: Color(0xff2855AE),
                                    ),
                                    onTap: () {
                                      Get.defaultDialog(
                                        title: 'what you want to do'.tr,
                                        content: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0001,
                                        ),
                                        actions: [
                                          Padding(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                GestureDetector(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 113, 216, 116),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    child: Center(
                                                        child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          "Appreciation".tr,
                                                          style: TextStyle(
                                                              color: white,
                                                              fontFamily:
                                                                  'Cairo',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.02),
                                                        ),
                                                        Image.asset(
                                                          'assets/icons/good.png',
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.06,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.07,
                                                          color: white,
                                                        ),
                                                      ],
                                                    )),
                                                  ),
                                                  onTap: () {
                                                    Get.close(1);
                                                    Get.defaultDialog(
                                                      title:
                                                          'type your description here:',
                                                      content: Column(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              CustemLoginTextField(
                                                                hieght: 68,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.95,
                                                                hintText: '',
                                                                onchanged:
                                                                    (value) {
                                                                  appdesc =
                                                                      value;
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.01,
                                                          ),
                                                          GestureDetector(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                          .blue[
                                                                      200],
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
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
                                                                "send".tr,
                                                                style: TextStyle(
                                                                    color:
                                                                        white,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.02),
                                                              )),
                                                            ),
                                                            onTap: () {
                                                              if (appdesc ==
                                                                  null) {
                                                                Fluttertoast
                                                                    .showToast(
                                                                  msg:
                                                                      'The description cant be empty',
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xff6688CA),
                                                                );
                                                              } else {
                                                                var type = 2;
                                                                controller.onTapSend(
                                                                    controller
                                                                        .StudentList2
                                                                        .id,
                                                                    appdesc,
                                                                    type);
                                                                appdesc = null;
                                                                wardesc = null;
                                                                EasyLoading.showSuccess(
                                                                    'Student has evaluated Successfully',
                                                                    dismissOnTap:
                                                                        true);
                                                                Get.close(1);
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                                GestureDetector(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 255, 87, 75),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.30,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    child: Center(
                                                        child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          "Warning".tr,
                                                          style: TextStyle(
                                                              color: white,
                                                              fontFamily:
                                                                  'Cairo',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.02),
                                                        ),
                                                        Image.asset(
                                                          'assets/icons/bad.png',
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.06,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.08,
                                                          color: white,
                                                        ),
                                                      ],
                                                    )),
                                                  ),
                                                  onTap: () {
                                                    Get.close(1);
                                                    Get.defaultDialog(
                                                      title:
                                                          'type your description here:',
                                                      content: Column(
                                                        children: [
                                                          CustemLoginTextField(
                                                            hieght: 68,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.95,
                                                            hintText: '',
                                                            onchanged: (value) {
                                                              wardesc = value;
                                                            },
                                                          ),
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.01,
                                                          ),
                                                          GestureDetector(
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                            .blue[
                                                                        200],
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
                                                                  "send".tr,
                                                                  style: TextStyle(
                                                                      color:
                                                                          white,
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.02),
                                                                )),
                                                              ),
                                                              onTap: () {
                                                                if (wardesc ==
                                                                    null) {
                                                                  //  EasyLoading.showSuccess(
                                                                  //   'The description cant be empty',
                                                                  //   dismissOnTap:
                                                                  //       true);
                                                                  Fluttertoast
                                                                      .showToast(
                                                                          msg:
                                                                              'The description cant be empty');
                                                                } else {
                                                                  var type = 1;
                                                                  controller.onTapSend(
                                                                      controller
                                                                          .StudentList2
                                                                          .id,
                                                                      wardesc,
                                                                      type);
                                                                  appdesc =
                                                                      null;
                                                                  wardesc =
                                                                      null;
                                                                  EasyLoading.showSuccess(
                                                                      'Student has evaluated Successfully',
                                                                      dismissOnTap:
                                                                          true);
                                                                  Get.close(1);
                                                                }
                                                                ;
                                                              }),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Divider(),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                      child: Row(
                                        children: [
                                          Text(
                                            'att. Rate'.tr + ' : ',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.020,
                                                color: white,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.normal),
                                          ),
                                          Text(
                                            '${controller.attendanceRate}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.020,
                                                color: Colors.greenAccent,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                      child: Row(
                                        children: [
                                          Text(
                                            's phone'.tr + ' : ',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.020,
                                                color: white,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.normal),
                                          ),
                                          Text(
                                            '${controller.phone}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.020,
                                                color: Colors.greenAccent,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Divider(),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.01),
                                  child: Row(
                                    children: [
                                      Text(
                                        'address'.tr + ' : ',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: white,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        '${controller.address}',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: Colors.greenAccent,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Divider(),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.01),
                                  child: Row(
                                    children: [
                                      Text(
                                        'email'.tr + ' : ',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: white,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        '${controller.email}',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: Colors.greenAccent,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Divider(),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Exam'.tr + ' : ',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: white,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        '${controller.examMark} / 100',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: Colors.greenAccent,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Quis'.tr + ' : ',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: white,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        '${controller.quizeMark} / 100',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: Colors.greenAccent,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
