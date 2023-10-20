import 'package:get/get.dart';
import 'package:my_school/student_app/modules/guist_code/guist_code_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuistCodeController extends GetxController {
  GuistCodeService service = GuistCodeService();
  @override
  void onInit() async {
    // TODO: implement onInit

    super.onInit();
  }

  var code;
  var validCode = true.obs;
  var courses = [];
  var message = '';
  bool isOk = true;
  sendCode() async {
    var id = 'lang';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.get('' + id));
    courses = await service.sendCode(code);
    if (service.isOk == true) {
      isOk = true;
      message = 'coursaddedsuccess';
    } else {
      isOk = false;
      message = 'codeisinvaled';
    }
  }
}
