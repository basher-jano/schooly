import 'package:get/get.dart';
import 'package:my_school/student_app/modules/guist_home_page/guist_home_page_service.dart';

class GuistHomePageController extends GetxController {
  @override
  var Listclass = [].obs;
  guestServuce service = new guestServuce();
  void onInit() async {
    // TODO: implement onInit
    print('hraaaaaaaa');
    Listclass.value = await service.getclassesGuest();

    print(Listclass.value[0].name);

    super.onInit();
  }
}
