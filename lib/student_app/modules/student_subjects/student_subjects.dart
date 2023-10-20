import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/student_app/modules/student_subjects/courses_files.dart';
import 'package:my_school/student_app/modules/student_subjects/student_subjects_controller.dart';

class StudentSubjects extends StatelessWidget {
  StudentSubjects({Key? key}) : super(key: key);
  var controller = Get.put(StudentSubjectsController());

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
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: Padding(
                        padding:  EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                        child: Obx(() {
                          if (controller.isLoading == true) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          
                          
                          
                           else {
                            return ListView.builder(
                              itemCount: controller.SubjectList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.015),
                                  child: Card(
                                      elevation: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffF5F6FC),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                                            child: InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                    '/courses_filse',
                                                    arguments: controller
                                                        .SubjectList[index],
                                                  );
                                                },
                                                child: Container(
                                                    child: Column(children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                          '${controller.SubjectList[index].name}',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .blue[200],
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.028,
                                                            fontFamily: "Cairo",
                                                          )),
                                                      Image.asset(
                                                        geturl(controller
                                                            .SubjectList[index]
                                                            .name),
                                                        color: Colors.blue[200],
                                                        width: MediaQuery.of(context).size.height * 0.05,
                                                        height: MediaQuery.of(context).size.height * 0.05,
                                                      ),
                                                    ],
                                                  ),
                                                ])))),
                                      )),
                                );
                              },
                            );
                          }
                        }))),
              )
            ],
          ),
        ),
      ),
    );
  }

  String geturl(String name) {
    if (name == 'كيمياء') {
      return 'assets/icons/chemistry.png';
    } else if (name == 'فيزياء') {
      return 'assets/icons/physics.png';
    }else if (name == 'رياضيات') {
      return 'assets/icons/math.png';
    }else if (name == 'علوم') {
      return 'assets/icons/scince.png';
    }
   else{
    return 'assets/icons/subject.png';
   }
  }
}
