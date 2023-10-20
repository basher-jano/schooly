import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:my_school/student_app/modules/guist_home_page/courses_guest_controller.dart';

class CoursesGeustBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<CoursesController>(CoursesController());
  }
}
