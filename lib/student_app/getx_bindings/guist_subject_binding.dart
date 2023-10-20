import 'package:get/get.dart';
import 'package:my_school/student_app/modules/guist_code/guist_code_controller.dart';
import 'package:my_school/student_app/modules/guist_home_page/guist_subject_controller.dart';

class GeustsubjectBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<GeustsubjectController>(GeustsubjectController());
  }
}
