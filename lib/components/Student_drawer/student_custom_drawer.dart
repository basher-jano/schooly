import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_school/components/Student_drawer/student_drawer_header.dart';
import 'package:my_school/components/drawer/my_drawer_header.dart';
import 'package:get/get.dart';
import 'package:my_school/config/server_config.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/modules/About_us/about_us.dart';
import 'package:my_school/modules/Help/help.dart';
import 'package:my_school/modules/Teacher_HomePage/teacher_home_page.dart';
import 'package:my_school/modules/Teacher_HomePage/teacher_home_page_controller.dart';
import 'package:my_school/modules/login_as/login_as.dart';
import 'package:my_school/modules/settings/settings.dart';
import 'package:my_school/modules/student/student.dart';
import 'package:my_school/modules/teacher_main_page/localization_service.dart';
import 'package:my_school/modules/teacher_main_page/teacher_main_page_screen.dart';
import 'package:my_school/student_app/modules/student_notes/student_notes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../student_app/modules/Notification/student_notification.dart';

class StudentCustomDrawer extends StatefulWidget {
  const StudentCustomDrawer({Key? key}) : super(key: key);

  @override
  State<StudentCustomDrawer> createState() => _StudentCustomDrawerState();
}

class _StudentCustomDrawerState extends State<StudentCustomDrawer> {
  // String _selectedLang = LocalizationService.langs.first;
  Future subsacrube() async {
    print('sd');
    await FirebaseMessaging.instance.subscribeToTopic('anwar');
  }

  Future changeLang() async {
    var langUrl = UserInformation.LANG == 'العربية'
        ? Uri.parse(
            ServerConfig.DNS + ServerConfig.studentchangeLang + '?Language=ar')
        : Uri.parse(
            ServerConfig.DNS + ServerConfig.studentchangeLang + '?Language=en');

    var langResponse = await http.get(langUrl, headers: {
      "Authorization": 'Bearer ${UserInformation.STUDENT_TOKEN}',
    });
    print(langUrl);
    print(' lang status code ${langResponse.statusCode}');
    print(langResponse.body);
    Get.offAllNamed('/studentmainpage');
    // TeacherHomePageController homeController = TeacherHomePageController();
    // homeController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          StudentHeaderDrawer(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          //  menuItem(1, 'Home', Icons.home,  ),
          //  Divider(),
          menuItem(
            2,
            UserInformation.LANG,
            Icons.translate,
          ),
          // Divider(),

          // menuItem(
          //   3,
          //   'help'.tr,
          //   Icons.emergency,
          // ),
          Divider(),

          menuItem(4, 'logout'.tr, Icons.logout),
          Divider(),
          menuItem(5, 'aboutus'.tr, Icons.info),
          Divider(),
          menuItem(6, 'Nots'.tr, Icons.send),
          Divider(),

          menuItem(7, 'Notification'.tr, Icons.notifications)
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon) {
    return Material(
      child: InkWell(
        onTap: () {
          setState(() async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            if (id == 1) {
              Get.to(TeacherHomepage());
            } else if (id == 2) {
              if (prefs.getString('lang') == LocalizationService.langs.last) {
                prefs.setString('lang', LocalizationService.langs.first);
              } else if (prefs.getString('lang') ==
                  LocalizationService.langs.first) {
                prefs.setString('lang', LocalizationService.langs.last);
              }
              UserInformation.LANG = prefs.getString('lang')!;
              LocalizationService().changeLocale(prefs.getString('lang')!);
              changeLang();
            } else if (id == 3) {
              Get.to(Help());
            } else if (id == 4) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('student_token');
              prefs.remove('student_phone');
              prefs.remove('student_email');
              prefs.remove('student_username');
              prefs.remove('student_address');
              prefs.remove('student_id');
             await FirebaseMessaging.instance.deleteToken();
              Get.offAllNamed('/splash');
            } else if (id == 5) {
              Get.to(AboutUS());
            } else if (id == 6) {
              Get.to(StudentNotes());
            } else if (id == 7) {
               Get.to(StudentNotification());
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
