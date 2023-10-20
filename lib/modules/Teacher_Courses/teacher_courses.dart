import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/components/Nav_Bar.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/Teacher_Courses/teacher_courses_controller.dart';
import 'package:my_school/modules/Teacher_Courses/teacher_vedio_courses.dart';

class TeacherCourses extends StatelessWidget {
  var controller = Get.put(TeacherCoursesController());

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: blueapp,
        onPressed: () async {
          Get.toNamed('/uploadVideo');
        },
      ),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.height * 0.02,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.65,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(() {
                            return ListView.builder(
                              itemCount: controller.list_name2.value.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Card(
                                      elevation: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffF5F6FC),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.all(40),
                                            child: InkWell(
                                                onTap: () {
                                                  Get.toNamed('/teachervideo',
                                                      arguments: [
                                                        controller.list_id2
                                                            .value[index],
                                                      ]);
                                                },
                                                child: Container(
                                                    child: Column(children: [
                                                  Text(
                                                      controller.list_name2
                                                          .value[index]
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Colors.blue[200],
                                                        fontSize: 18.0,
                                                      )),
                                                ])))),
                                      )),
                                );
                              },
                            );
                          }))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
