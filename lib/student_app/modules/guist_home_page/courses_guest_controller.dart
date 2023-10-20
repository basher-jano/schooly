import 'package:get/get.dart';
import 'package:my_school/student_app/modules/guist_home_page/guist_home_page_service.dart';

class CoursesController extends GetxController {
  var listcousres = [].obs;
  guestServuce service = new guestServuce();
  var gradeid = Get.arguments[0];
  var subjectid = Get.arguments[1];
  var Courseslist = [].obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    print(gradeid);
    print(subjectid);
  Courseslist.value= await service.getCoursesGeust(gradeid, subjectid);
    super.onInit();
  }
}
