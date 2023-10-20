import 'package:get/get.dart';
import 'package:my_school/modules/Teacher_Courses/video_controller.dart';

class VideoBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<VideoController>(VideoController());
  }
}
