import 'package:get/get.dart';
import 'package:my_school/modules/Student/student_service.dart';

import '../../models/class_student_model.dart';

class StudentController extends GetxController {
 
  var message;

 
  StudentServise service = StudentServise();
  var StudentList2;
  var name;
  var attendanceRate;
  int? examMark;
  int? quizeMark;
  var avatar;
  var phone;
  var address;
  var email;

  @override
  void onInit() {
    // TODO: implement onInit

    StudentList2 = Get.arguments;
    name = StudentList2.name;
    phone = StudentList2.phone;
    address = StudentList2.address;
    email = StudentList2.email;
    attendanceRate = StudentList2.marks.attendanceRate;
    examMark = StudentList2.marks.examMark;
    quizeMark = StudentList2.marks.quizeMark;
    avatar = StudentList2.avatar;
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  Future<void> onTapSend(id,note,type) async {
    message = await service.evaluatstudent(id,note,type);
 
    print('messssssaaaageeeeeeeee: ${message}');
  }
}
