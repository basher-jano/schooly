import 'package:get/get.dart';
import 'package:my_school/modules/Class/class_controller.dart';

class ClassBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ClassesController>(ClassesController());
  }
  
}