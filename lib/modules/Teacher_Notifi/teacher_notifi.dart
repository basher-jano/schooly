import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/Teacher_Notifi/teacher_notifi_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherNotification extends StatefulWidget {
  const TeacherNotification({Key? key}) : super(key: key);

  @override
  State<TeacherNotification> createState() => _TeacherNotificationState();
}

var controller = Get.put(TeacherNotificationController());

class _TeacherNotificationState extends State<TeacherNotification> {
  bool isSwitched = false;
  var textValue = 'Notification is OFF';
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
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.008),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Transform.scale(
                                      scale: 1.5,
                                      child: Switch(
                                        onChanged: toggleSwitch,
                                        value: UserInformation.TEACHER_GET_NOTF,
                                        activeColor: Colors.green,
                                        activeTrackColor:
                                            Color.fromARGB(255, 134, 134, 134),
                                        inactiveThumbColor: Colors.redAccent,
                                        inactiveTrackColor:
                                            Color.fromARGB(255, 134, 134, 134),
                                      )),
                                  Text(
                                    '$textValue',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.020,
                                      fontFamily: "Cairo",
                                    ),
                                  ),
                                ],
                              ),
                              Obx(() {
                                if (controller.isLoading == true) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return ListView.separated(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
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
                                                    // mainAxisAlignment:MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          controller
                                                              .NofificationList[
                                                                  index]
                                                              .title,
                                                          style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255, 24, 14, 112),
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.023,
                                                            fontFamily: "Cairo",
                                                          )),
                                                      Text(
                                                          controller
                                                              .NofificationList[
                                                                  index]
                                                              .content,
                                                          style: TextStyle(
                                                            color:
                                                                Colors.blue[200],
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.020,
                                                            fontFamily: "Cairo",
                                                          )),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                              '${controller.NofificationList[index].date}',
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        79,
                                                                        102,
                                                                        121),
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.015,
                                                                fontFamily:
                                                                    "Cairo",
                                                              )),
                                                        ],
                                                      )
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
                                    itemCount: controller.NofificationList.length,
                                  );
                                }
                              }),
                            ],
                          )),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> toggleSwitch(bool value) async {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Notification is ON';
      });

      controller.onActiveNoti();
    } else if (isSwitched == true) {
      setState(() {
        isSwitched = false;
        textValue = 'Notification is OFF';
      });

      controller.onDisactiveNoti();
    }
  }
}
