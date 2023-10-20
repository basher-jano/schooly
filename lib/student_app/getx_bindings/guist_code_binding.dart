import 'package:get/get.dart';
import 'package:my_school/student_app/modules/guist_code/guist_code_controller.dart';

class GuistCodeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<GuistCodeController>(GuistCodeController());
  }
}
