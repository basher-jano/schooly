import 'package:get/get.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/student_app/notifcations/listen_on_notifcations.dart';

class teacherMainPageController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    if (UserInformation.STUDENT_GET_NOTF == true) {
      listenOnNotefcations();
    }
    super.onInit();
  }
}
