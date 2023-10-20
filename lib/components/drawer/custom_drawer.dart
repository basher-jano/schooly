import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_school/components/drawer/my_drawer_header.dart';
import 'package:get/get.dart';
import 'package:my_school/config/server_config.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/modules/About_us/about_us.dart';
import 'package:my_school/modules/Help/help.dart';
import 'package:my_school/modules/Teacher_HomePage/teacher_home_page.dart';
import 'package:my_school/modules/Teacher_HomePage/teacher_home_page_controller.dart';
import 'package:my_school/modules/Teacher_Notifi/teacher_notifi.dart';
import 'package:my_school/modules/teacher_main_page/localization_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // String _selectedLang = LocalizationService.langs.first;

  Future changeLang() async {
    var langUrl = UserInformation.LANG == 'العربية'
        ? Uri.parse(ServerConfig.DNS + ServerConfig.changeLang + '?Language=ar')
        : Uri.parse(
            ServerConfig.DNS + ServerConfig.changeLang + '?Language=en');

    var langResponse = await http.get(langUrl, headers: {
      "Authorization": 'Bearer ${UserInformation.USER_TOKEN}',
    });
    print(langUrl);
    print(' lang status code ${langResponse.statusCode}');
    print(langResponse.body);
    TeacherHomePageController homeController = TeacherHomePageController();
    homeController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          MyHeaderDrawer(),
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
          Divider(),

          // menuItem(
          //   3,
          //   'help'.tr,
          //   Icons.emergency,
          // ),
          // Divider(),

          menuItem(4, 'logout'.tr, Icons.logout),
          Divider(),
          menuItem(5, 'aboutus'.tr, Icons.info),
          Divider(),

          menuItem(6, 'Notification'.tr, Icons.notifications),
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
              prefs.remove('token');
              prefs.remove('phone');
              prefs.remove('email');
              prefs.remove('username');
              prefs.remove('address');
              prefs.remove('id');
              prefs.setBool('tea_get_notf', false);
              prefs.setBool('stu_get_notf', false);
              await FirebaseMessaging.instance.deleteToken();
              Get.offAllNamed('/splash');
            } else if (id == 5) {
              Get.to(AboutUS());
            } else if (id == 6) {
              Get.to(TeacherNotification());
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
