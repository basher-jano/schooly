import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/student_app/modules/Notification/notification_service.dart';
import 'package:my_school/student_app/notifcations/listen_on_notifcations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/student_notification_model.dart';

class StudentNotificationController extends GetxController {
  @override
  StudentNotificationService service = StudentNotificationService();
  List<Result> NofificationList = [];
  var isLoading = true.obs;

  void onInit() async {
    NofificationList = await service.StudentNotification();
    isLoading(false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserInformation.STUDENT_GET_NOTF = prefs.getBool('stu_get_notf')!;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  onActiveNoti() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stu_get_notf', true);
    UserInformation.STUDENT_GET_NOTF = prefs.getBool('stu_get_notf')!;

    FirebaseMessaging.instance.getToken().then((value) {
      service.update_fir_token(value);
      print('fcm token :$value');
    });
    listenOnNotefcations();
  }

  onDisactiveNoti() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('stu_get_notf', false);
    UserInformation.STUDENT_GET_NOTF = prefs.getBool('stu_get_notf')!;

    await FirebaseMessaging.instance.deleteToken().then((value) {
      service.update_fir_token('0');
    });
  }
}
