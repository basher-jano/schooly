import 'package:get/get.dart';
import 'package:my_school/student_app/modules/student_history/student_history_controller.dart';
import 'package:my_school/student_app/modules/student_login/student_login_controller.dart';

class StudentHistoryBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<StudentHistoryController>(StudentHistoryController());
  }
}
