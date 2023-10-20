import 'package:get/get.dart';
import 'package:my_school/student_app/modules/student_subjects/video_controller.dart';

class VideoStudentBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<VideoStudentController>(VideoStudentController());
  }
}