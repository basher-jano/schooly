import 'package:get/get.dart';
import 'package:my_school/modules/Teacher_Login/teacher_login_controller.dart';

class TeacherLoginBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TeacherLoginController>(TeacherLoginController());
  }
}
