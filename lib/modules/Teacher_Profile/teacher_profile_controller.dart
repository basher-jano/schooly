import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherProfileController extends GetxController {
  String username = '';
  @override
  void onInit() async {
    // TODO: implement onInit
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username')!;
    super.onInit();
  }
}
