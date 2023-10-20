import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/components/Nav_Bar.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/Class/class.dart';
import 'package:my_school/modules/Teacher_Classes/teacher_classes_controller.dart';

class TeacherClasses extends StatelessWidget {
  @override
  var controller = Get.put(TeacherClassesController());

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
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: controller.classesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Card(
                                elevation: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffF5F6FC),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(40),
                                      child: InkWell(
                                          onTap: () {
                                            print(
                                                'controller.classesList[index].id:  ${controller.classesList[index].id}');

                                            Get.toNamed(
                                              '/class',
                                              arguments:
                                                  controller.classesList[index],
                                            );
                                          },
                                          child: Column(children: [
                                            Text(
                                                '${controller.classesList[index].name}',
                                                style: TextStyle(
                                                  color: Colors.blue[200],
                                                  fontSize: 18.0,
                                                  fontFamily: "Cairo",
                                                )),
                                          ]))),
                                )),
                          );
                        },
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
