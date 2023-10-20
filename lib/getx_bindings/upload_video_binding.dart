import 'package:get/get.dart';
import 'package:my_school/modules/Teacher_Courses/upload_video_controler.dart';

class UploadVideoBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
       Get.put<UploadVideoController>(UploadVideoController());
  }

}