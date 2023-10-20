import 'package:get/get.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/modules/splash/splash_service.dart';
import 'package:my_school/modules/teacher_main_page/localization_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  var lang = ''.obs;
  var onORoff = false.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var service = SplashService();
    UserInformation.TEACHER_GET_NOTF = prefs.getBool('tea_get_notf')??false;
    UserInformation.STUDENT_GET_NOTF = prefs.getBool('stu_get_notf')??false;

    if (!(prefs.containsKey('lang'))) {
      prefs.setString('lang', LocalizationService.langs.first);
      UserInformation.LANG = prefs.getString('lang')!;
      print('data has been cleared');
    }
    LocalizationService().changeLocale(prefs.getString('lang')!);
    UserInformation.LANG = prefs.getString('lang')!;
    lang.value = UserInformation.LANG;
    // teacher part
    if (prefs.getString('username') != '') {
      UserInformation.USER_NAME = prefs.getString('username') ?? '';
    }
    if (prefs.getString('teacher_avatar') != '') {
      UserInformation.TEACHER_AVATAR = prefs.getString('teacher_avatar') ?? '';
    }
    if (prefs.getString('student_avatar') != '') {
      UserInformation.STUDENT_AVATAR = prefs.getString('student_avatar') ?? '';
    }
    if (prefs.getString('id') != '') {
      UserInformation.USER_ID = prefs.getString('id') ?? '';
    }
    if (prefs.getString('email') != '') {
      UserInformation.USER_EMAIL = prefs.getString('email') ?? '';
    }
    if (prefs.getString('phone') != '') {
      UserInformation.USER_PHONE = prefs.getString('phone') ?? '';
    }
    if (prefs.getString('address') != '') {
      UserInformation.USER_ADDRESS = prefs.getString('address') ?? '';
    }

    if (prefs.getString('token') != '' && prefs.getString('token') != null) {
      UserInformation.USER_TOKEN = prefs.getString('token')!;
      await service.changeLang();
      Get.offAllNamed('techermainpage');
    }
    // student part
    if (prefs.getString('student_username') != '') {
      UserInformation.STUDENT_NAME = prefs.getString('student_username') ?? '';
    }
    if (prefs.getDouble('student_avg') != '') {
      UserInformation.STUDENT_AVG = prefs.getDouble('student_avg') ?? 0;
    }
    if (prefs.getInt('student_attendance_rate') != '') {
      UserInformation.STUDENT_ATTENDANCE_RATE =
          prefs.getInt('student_attendance_rate') ?? 0;
    }
    if (prefs.getString('student_id') != '') {
      UserInformation.STUDENT_ID = prefs.getString('student_id') ?? '';
    }
    if (prefs.getString('student_email') != '') {
      UserInformation.STUDENT_EMAIL = prefs.getString('student_email') ?? '';
    }
    if (prefs.getString('student_phone') != '') {
      UserInformation.STUDENT_PHONE = prefs.getString('student_phone') ?? '';
    }
    if (prefs.getString('student_address') != '') {
      UserInformation.STUDENT_ADDRESS =
          prefs.getString('student_address') ?? '';
    }

    if (prefs.getString('student_token') != '' &&
        prefs.getString('student_token') != null) {
      UserInformation.STUDENT_TOKEN = prefs.getString('student_token') ?? '';
      await service.changeLang();
      Get.offAllNamed('studentmainpage');
    }

    if ((prefs.getString('student_token') == '' ||
            prefs.getString('student_token') == null) &&
        (prefs.getString('token') == '' || prefs.getString('token') == null)) {
      onORoff.value = true;
    }
    super.onInit();
  }

  void changeLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('lang') == 'English') {
      prefs.setString('lang', 'العربية');
      UserInformation.LANG = prefs.getString('lang')!;
      lang.value = UserInformation.LANG;

      LocalizationService().changeLocale(prefs.getString('lang')!);
    } else if (prefs.getString('lang') == 'العربية') {
      prefs.setString('lang', 'English');
      UserInformation.LANG = prefs.getString('lang')!;
      lang.value = UserInformation.LANG;

      LocalizationService().changeLocale(prefs.getString('lang')!);
    }
  }
}
