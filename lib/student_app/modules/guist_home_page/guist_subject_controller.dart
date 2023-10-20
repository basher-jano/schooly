import 'package:get/get.dart';
import 'package:my_school/student_app/modules/guist_home_page/guist_home_page_service.dart';

class GeustsubjectController extends GetxController {
  @override
  var subjectlist = [].obs;
late  var gradid;
  guestServuce service = new guestServuce();
  void onInit() async {
    // TODO: implement onInit
    gradid= Get.arguments;
    print('object');
    print(gradid);
    subjectlist.value = await service.getsubjectservice();

    super.onInit();
  }
}
