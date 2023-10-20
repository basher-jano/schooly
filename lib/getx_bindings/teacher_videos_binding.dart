

import 'package:get/get.dart';

import '../modules/Teacher_Courses/teacher_video_controller.dart';


class TeacherVedioBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TeacherVideosController>(TeacherVideosController());
  }

}