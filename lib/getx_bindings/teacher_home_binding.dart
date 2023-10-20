import 'package:get/get.dart';
import 'package:my_school/modules/Teacher_HomePage/teacher_home_page_controller.dart';

class TeacherHomeBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TeacherHomePageController>(TeacherHomePageController());
  }
  
}