import 'package:flutter/material.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/modules/teacher_main_page/localization_service.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  String _selectedLang = LocalizationService.langs.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/student.jpg'),
              ),
            ),
          ),
          Text(
            UserInformation.USER_NAME,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.normal),
          ),
          Text(
            UserInformation.USER_EMAIL,
            style: TextStyle(
                color: Colors.grey[200],
                fontSize: 14,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
