import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/modules/Teacher_Notifi/teacher_notifi_service.dart';
import 'package:my_school/student_app/notifcations/listen_on_notifcations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/student_notification_model.dart';

class TeacherNotificationController extends GetxController {
  @override
  TeacherNotificationService service = TeacherNotificationService();
  List<Result> NofificationList = [];
  var isLoading = true.obs;

  void onInit() async {
    NofificationList = await service.TeacherNotification();
    isLoading(false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserInformation.TEACHER_GET_NOTF = prefs.getBool('tea_get_notf')!;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  onActiveNoti() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('tea_get_notf', true);
    UserInformation.TEACHER_GET_NOTF = prefs.getBool('tea_get_notf')!;
    FirebaseMessaging.instance.getToken().then((value) {
      service.update_fir_token(value);
      print('fcm token :$value');
    });
    listenOnNotefcations();
  }

  onDisactiveNoti() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('tea_get_notf', false);
    UserInformation.TEACHER_GET_NOTF = prefs.getBool('tea_get_notf')!;
    await FirebaseMessaging.instance.deleteToken().then((value) {
      service.update_fir_token('0');
    });
  }
}
