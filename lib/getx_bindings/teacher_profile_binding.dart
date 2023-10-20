

import 'package:get/get.dart';
import 'package:my_school/modules/Teacher_Profile/teacher_profile_controller.dart';
import 'package:my_school/modules/Teacher_upload_file/Teacher_upload_file_controller.dart';

class TeacherProfilBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TeacherProfileController>(TeacherProfileController());
  }
  
}