import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/components/drawer/custom_drawer.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/Teacher_Classes/teacher_classes.dart';
import 'package:my_school/modules/Teacher_Courses/teacher_courses.dart';
import 'package:my_school/modules/Teacher_Files/teacher_files.dart';
import 'package:my_school/modules/Teacher_HomePage/teacher_home_page.dart';
import 'package:my_school/modules/Teacher_Profile/teacher_profile.dart';
import 'package:my_school/modules/teacher_main_page/teacher_main_page_controller.dart';

class teacherMainPage extends StatefulWidget {
  @override
  State<teacherMainPage> createState() => _teacherMainPageState();
}

class _teacherMainPageState extends State<teacherMainPage> {
  teacherMainPageController controller = Get.find();

  int _SelectedIndex = 0;
  List<Widget> _WidgetOptions = <Widget>[
    TeacherHomepage(),
    TeacherClasses(),
    TeacherFilesPage(),
    TeacherCourses(),
    TeacherProfile()
  ];

  Widget cruntPage = TeacherHomepage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _WidgetOptions.elementAt(_SelectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(
                        0.0, MediaQuery.of(context).size.height * -0.012),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            cruntPage = teacherMainPage();
                            _SelectedIndex = 2;
                          },
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                            color: blueapp,
                            borderRadius: BorderRadius.circular(100)),
                        child: const Icon(
                          Icons.upload_rounded,
                          color: white,
                        ),
                      ),
                    ),
                  )
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(100),
                  //   child: MaterialButton(
                  //     minWidth: MediaQuery.of(context).size.width * 0.01,
                  //     onPressed: () {
                  //       setState(
                  //         () {
                  //           cruntPage = teacherMainPage();
                  //           _SelectedIndex = 2;
                  //         },
                  //       );
                  //     },
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(50),
                  //       child: Card(
                  //         elevation: 2,
                  //         child: Container(
                  //           width: 50,
                  //           height: 50,
                  //           decoration: BoxDecoration(
                  //               color: blueapp,
                  //               borderRadius: BorderRadius.circular(100)),
                  //           child: Icon(
                  //             Icons.upload,
                  //             color: _SelectedIndex == 2 ? white : black,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.1,
                    onPressed: () {
                      setState(
                        () {
                          cruntPage = teacherMainPage();
                          _SelectedIndex = 0;
                        },
                      );
                    },
                    child: Icon(
                      Icons.home,
                      color: _SelectedIndex == 0 ? blueapp : black,
                    ),
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.1,
                    onPressed: () {
                      setState(
                        () {
                          cruntPage = teacherMainPage();
                          _SelectedIndex = 1;
                        },
                      );
                    },
                    child: Icon(
                      Icons.school,
                      color: _SelectedIndex == 1 ? blueapp : black,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.1,
                    onPressed: () {
                      setState(
                        () {
                          cruntPage = teacherMainPage();
                          _SelectedIndex = 3;
                        },
                      );
                    },
                    child: Icon(
                      Icons.video_collection,
                      color: _SelectedIndex == 3 ? blueapp : black,
                    ),
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.1,
                    onPressed: () {
                      setState(
                        () {
                          cruntPage = teacherMainPage();
                          _SelectedIndex = 4;
                        },
                      );
                    },
                    child: Icon(
                      Icons.person,
                      color: _SelectedIndex == 4 ? blueapp : black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
