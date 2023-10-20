import 'package:get/get.dart';
import 'package:my_school/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SplashController>(SplashController());
  }
  
}