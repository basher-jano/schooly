import 'package:flutter/material.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/modules/teacher_main_page/localization_service.dart';

class StudentHeaderDrawer extends StatefulWidget {
  @override
  _StudentHeaderDrawerState createState() => _StudentHeaderDrawerState();
}

class _StudentHeaderDrawerState extends State<StudentHeaderDrawer> {
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
            UserInformation.STUDENT_NAME,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.normal),
          ),
          Text(
            UserInformation.STUDENT_EMAIL,
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
