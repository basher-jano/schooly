import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/Class/class_controller.dart';
import 'package:my_school/modules/Student/student.dart';
import 'package:my_school/modules/Teacher_Classes/teacher_classes.dart';

class Class extends StatelessWidget {
  var controller = Get.put(ClassesController());

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
                        padding: const EdgeInsets.all(8.0),
                        
                        child: Obx(() {
                          if (controller.isLoading == true) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if(controller.StudentList.isEmpty){
                            
                            return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.no_accounts,color: Colors
                                                                    .blue[200],size: 50,),
                                Text('no student found !'.tr,  style: TextStyle(
                                                                color: Colors
                                                                    .blue[200],
                                                                fontSize: 18.0,
                                                                fontFamily: 'Cairo',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal)),
                              ],
                            ));
                          }
                           else {
                            return GridView.builder(
                              itemCount: controller.StudentList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 4.0,
                                      mainAxisSpacing: 4.0),
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
                                                  Get.toNamed(
                                                    '/Student',
                                                    arguments:
                                                  controller.StudentList[index],
                                                  );
                                                },
                                                child: Stack(children: [
                                                  Center(
                                                    child: Text(
                                                        controller
                                                            .StudentList[index]
                                                            .name,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blue[200],
                                                            fontSize: 18.0,
                                                            fontFamily: 'Cairo',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                  ),
                                                ]))),
                                      )),
                                );
                              },
                            );
                          }
                        }
                        )
                        )
                        ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
