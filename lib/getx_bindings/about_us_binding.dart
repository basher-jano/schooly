import 'package:get/get.dart';
import 'package:my_school/modules/About_us/about_us_controller.dart';

class AboutUsBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<AboutUsController>(AboutUsController());
  }
  
}