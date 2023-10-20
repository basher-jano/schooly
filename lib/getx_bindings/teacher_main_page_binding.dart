import 'package:get/get.dart';
import 'package:my_school/modules/teacher_main_page/teacher_main_page_controller.dart';

class teacherMainPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<teacherMainPageController>(teacherMainPageController());
  }
}
