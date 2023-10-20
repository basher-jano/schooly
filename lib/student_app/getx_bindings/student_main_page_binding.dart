import 'package:get/get.dart';
import 'package:my_school/student_app/modules/student_main_page/student_main_page_controller.dart';

class StudentMainPageBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<studentMainPageController>(studentMainPageController());
  }
}
