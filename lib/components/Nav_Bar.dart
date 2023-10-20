import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: white,
      fixedColor: Colors.black,
      items: [
          
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Get.offAllNamed('/teacherclasses');
            },
            child: Icon(
              Icons.class_,
              color: secondBackColor,
              size: 30,
            ),
          ),
          label: 'My classes',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Get.offAllNamed('/teacheruploadfile');
            },
            child: Icon(
              Icons.upload_file,
              color: secondBackColor,
              size: 30,
            ),
          ),
          label: 'upload file',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Get.offAllNamed('/teacherhome');
            },
            child: Icon(
              Icons.home_filled,
              color: secondBackColor,
              size: 30,
            ),
          ),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Get.offAllNamed('/teachercourses');
            },
            child: Icon(
              Icons.play_lesson,
              color: secondBackColor,
              size: 30,
            ),
          ),
          label: 'My courses',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Get.offAllNamed('/teacherprofile');
            },
            child: Icon(
              Icons.person,
              color: secondBackColor,
              size: 30,
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
