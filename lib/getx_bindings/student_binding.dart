
import 'package:get/get.dart';
import 'package:my_school/modules/Student/student_controller.dart';

class StudentBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<StudentController>(StudentController());
  }
  
}