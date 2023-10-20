
import 'package:get/get.dart';
import 'package:my_school/modules/Help/help_controller.dart';

class HelpBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HelpController>(HelpController());
  }
  
}