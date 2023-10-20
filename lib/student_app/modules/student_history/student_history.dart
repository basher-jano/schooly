import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_school/constant.dart';
import 'package:expandable/expandable.dart';
import 'package:my_school/student_app/modules/student_history/student_history_controller.dart';

class StudentHistory extends StatelessWidget {
  var controller = Get.put(StudentHistoryController());

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
                      text: 'evaloations'.tr,
                    ),
                    Tab(
                      text: 'marks'.tr,
                    )
                  ]),
            ),
            body: TabBarView(children: [
              Container(
                ///basher code
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: background,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset('assets/images/background.png'),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.6,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50))),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.045,
                                    right: MediaQuery.of(context).size.width *
                                        0.045,
                                    top: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  child: Obx(
                                    () => controller.evaloations_length.value ==
                                            0
                                        ? Container()
                                        : ListView(
                                            children: List.generate(
                                              controller
                                                  .evaloations_length.value,
                                              (index) => InkWell(
                                                onTap: () {
                                                  Get.defaultDialog(
                                                    content: Text(
                                                      controller
                                                          .evaloations[index]
                                                          .note,
                                                      style: TextStyle(
                                                        color: controller
                                                                    .evaloations[
                                                                        index]
                                                                    .evaloation ==
                                                                'Appreciation'
                                                            ? Colors.green
                                                            : Colors.red,
                                                        fontFamily: 'Cairo',
                                                      ),
                                                    ),
                                                    title: 'ditails'.tr,
                                                    titleStyle: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: 'Cairo',
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.01,
                                                  ),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    decoration: BoxDecoration(
                                                      color: controller
                                                                  .evaloations[
                                                                      index]
                                                                  .evaloation ==
                                                              'Appreciation'
                                                          ? Colors.green
                                                              .withOpacity(0.5)
                                                          : Colors.red
                                                              .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.03,
                                                        vertical: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.008,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  controller
                                                                      .evaloations[
                                                                          index]
                                                                      .subject,
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        white,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.022,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  )),
                                                              Text(
                                                                  'clicktoshowditails'
                                                                      .tr,
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        white,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.02,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  )),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  'teacher'.tr +
                                                                      ' ' +
                                                                      controller
                                                                          .evaloations[
                                                                              index]
                                                                          .teacher,
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        white,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.018,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  )),
                                                              Text(
                                                                  DateFormat(
                                                                          'yyyy-MM-dd – kk:mm')
                                                                      .format(controller
                                                                          .evaloations[
                                                                              index]
                                                                          .createdAt),
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        white,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.013,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  )),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                  )),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.is_loading == true) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return 
                  Container(
                  //anwar code
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    gradient: background,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset('assets/images/background.png'),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50))),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.045,
                                    right: MediaQuery.of(context).size.width *
                                        0.045,
                                    top: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      
                                      itemBuilder: ((_, index) {
                                        return Container(
                                          
                                          color: Colors.white,
                                          child: ExpandablePanel(
                                              collapsed: Text(''),
                                              header: Padding(
                                                padding:  EdgeInsets.all(MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.015,),
                                                child: Text(
                                                    '${controller.list_marks[index].subject}', style: TextStyle(
                                                              color: Colors
                                                                  .blue,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.025,
                                                              fontFamily: "Cairo",
                                                            )),
                                              ),
                                              expanded: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                    Text('Exam'.tr, style: TextStyle(
                                                              color: Colors
                                                                  .blue,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.020,
                                                              fontFamily: "Cairo",
                                                            )),
                                                    Text(
                                                      '${controller.list_marks[index].examMark}', style: TextStyle(
                                                             color: controller.quiz[index]
                                                       >=60
                                                ? Colors.green
                                                : Colors.red,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.020,
                                                              fontFamily: "Cairo",
                                                            ))
                                                  ],),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    
                                                    children: [
                                                    Text('Quiz'.tr, style: TextStyle(
                                                              color: Colors
                                                                  .blue,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.020,
                                                              fontFamily: "Cairo",
                                                            )),
                                                    Text(
                                                         '${controller.quiz[index]}', style: TextStyle(
                                                              color: controller.quiz[index]
                                                       >=60
                                                ? Colors.green
                                                : Colors.red,

                                                              
                                                              
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.020,
                                                              fontFamily: "Cairo",
                                                            )
                                                       )
                                                  ],)
                                                  
                                                ],
                                              )),
                                        );
                                      }),
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: 20,
                                        );
                                      },
                                      itemCount: controller.list_marks.length),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ))
             
          ;
           
           
           
           
           
           
           
           
           
           
           
              })
            ])));
  }
}
