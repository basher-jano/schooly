import 'package:get/get.dart';

import '../modules/Notification/student_notification_controller.dart';


class StudentNotificationBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<StudentNotificationController>(StudentNotificationController());
  }
}