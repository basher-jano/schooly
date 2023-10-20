
import 'package:get/get.dart';
import 'package:my_school/modules/Teacher_upload_file/Teacher_upload_file_controller.dart';

class TeacherUploadFileBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TeacherUploadFileController>(TeacherUploadFileController());
  }
  
}