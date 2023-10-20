
import 'package:get/get.dart';
import 'package:my_school/modules/settings/setting_controller.dart';

class SettingBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SettingController>(SettingController());
  }
  
}