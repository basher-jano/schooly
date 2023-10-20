import 'package:get/get.dart';
import 'package:my_school/modules/Teacher_login/teacher_login_controller.dart';
import 'package:my_school/modules/login_as/login_as_controller.dart';

class loginAsBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<loginAsController>(loginAsController());
  }
}
