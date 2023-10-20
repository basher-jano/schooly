import 'package:get/get.dart';
import 'package:my_school/student_app/modules/student_subjects/courses_files_controller.dart';

class CoursesFilesBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<CoursesFilesController>(CoursesFilesController());
  }
}
