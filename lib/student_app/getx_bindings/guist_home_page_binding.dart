import 'package:get/get.dart';
import 'package:my_school/student_app/modules/guist_home_page/guist_home_page_controller.dart';

class GuistHomePageBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<GuistHomePageController>(GuistHomePageController());
  }
}
