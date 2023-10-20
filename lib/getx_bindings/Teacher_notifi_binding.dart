import 'package:get/get.dart';
import 'package:my_school/modules/Teacher_Notifi/teacher_notifi_controller.dart';



class TeacherNotificationBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TeacherNotificationController>(TeacherNotificationController());
  }
}