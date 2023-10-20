import 'package:get/get.dart';
import 'package:my_school/student_app/modules/student_profile/student_profile_controller.dart';

class StudentProfileBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<StudentProfileController>(StudentProfileController());
  }
}
