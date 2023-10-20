import 'package:get/get.dart';
import 'package:my_school/student_app/modules/student_subjects/student_subjects_controller.dart';

class StudentSubjectsBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<StudentSubjectsController>(StudentSubjectsController());
  }
}
