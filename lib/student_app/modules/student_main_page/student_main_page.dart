import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/components/Student_drawer/student_custom_drawer.dart';
import 'package:my_school/components/drawer/custom_drawer.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/student_app/modules/student_history/student_history.dart';
import 'package:my_school/student_app/modules/student_home_page/student_home_page.dart';
import 'package:my_school/student_app/modules/student_main_page/student_main_page_controller.dart';
import 'package:my_school/student_app/modules/student_profile/student_profile.dart';
import 'package:my_school/student_app/modules/student_subjects/student_subjects.dart';

class studentMainPage extends StatefulWidget {
  @override
  State<studentMainPage> createState() => _studentMainPageState();
}

class _studentMainPageState extends State<studentMainPage> {
  studentMainPageController controller = Get.find();

  int _SelectedIndex = 0;
  List<Widget> _WidgetOptions = <Widget>[
    StudentHomepage(),
    StudentSubjects(),
    StudentHistory(),
    StudentProfile(),
  ];

  Widget cruntPage = StudentHomepage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _WidgetOptions.elementAt(_SelectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.2,
                onPressed: () {
                  setState(
                    () {
                      cruntPage = studentMainPage();
                      _SelectedIndex = 0;
                    },
                  );
                },
                child: Icon(
                  Icons.home,
                  color: _SelectedIndex == 0 ? firstBackColor : black,
                ),
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.2,
                onPressed: () {
                  setState(
                    () {
                      cruntPage = studentMainPage();
                      _SelectedIndex = 1;
                    },
                  );
                },
                child: Icon(
                  Icons.class_outlined,
                  color: _SelectedIndex == 1 ? firstBackColor : black,
                ),
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.2,
                onPressed: () {
                  setState(
                    () {
                      cruntPage = studentMainPage();
                      _SelectedIndex = 2;
                    },
                  );
                },
                child: Icon(
                  Icons.history_edu,
                  color: _SelectedIndex == 2 ? firstBackColor : black,
                ),
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.2,
                onPressed: () {
                  setState(
                    () {
                      cruntPage = studentMainPage();
                      _SelectedIndex = 3;
                    },
                  );
                },
                child: Icon(
                  Icons.person,
                  color: _SelectedIndex == 3 ? firstBackColor : black,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: StudentCustomDrawer(),
    );
  }
}
