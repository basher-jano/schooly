import 'package:get/get.dart';

import '../modules/guist_home_page/Video_controller.dart';

class VideoGuestBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<VideoController>(VideoController());
  }
}
