
import 'package:get/get.dart';
import 'package:my_school/modules/Teacher_Files/teacher_files_controller.dart';

class TeacherFilesPageBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TeacherFilesPageController>(TeacherFilesPageController());
  }
  
}