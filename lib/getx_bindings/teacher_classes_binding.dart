
import 'package:get/get.dart';
import 'package:my_school/modules/Teacher_Classes/teacher_classes_controller.dart';

class TeacherClassesBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TeacherClassesController>(TeacherClassesController());
  }
  
}