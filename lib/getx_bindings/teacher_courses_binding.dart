
import 'package:get/get.dart';
import 'package:my_school/modules/Teacher_Courses/teacher_courses_controller.dart';

class TeacherCoursesBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TeacherCoursesController>(TeacherCoursesController());
  }
  
}