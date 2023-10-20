import 'package:get/get.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:my_school/modules/Teacher_HomePage/teacher_home_page_service.dart';

class TeacherHomePageController extends GetxController {
  var currentSliderIndex = 0.obs;
  final CarouselController sliderController = CarouselController();

  final List<String> imgList = [
    'https://eitrawmaterials.eu/wp-content/uploads/2019/05/Label-brochure-1.jpg',
    'https://www.goingabroad.nl/wp-content/uploads/2022/01/student-work-in-rotterdam.jpeg',
    'https://www.abdn.ac.uk/img/850x/students/slideshow-images/shutterstock_658847998_rdax_850x567.jpg',
    'https://s30383.pcdn.co/wp-content/uploads/2020/12/topic-faculty-active-engaged-students-1.png',
  ];
  var posts = [
    {
      'des':
          'this is description 1 nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn',
      'pic':
          'https://eitrawmaterials.eu/wp-content/uploads/2019/05/Label-brochure-1.jpg'
    },
    {
      'des':
          'this is description 2 nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn',
      'pic':
          'https://eitrawmaterials.eu/wp-content/uploads/2019/05/Label-brochure-1.jpg'
    },
    {
      'des':
          'this is description 3 nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn',
      'pic':
          'https://eitrawmaterials.eu/wp-content/uploads/2019/05/Label-brochure-1.jpg'
    },
    {
      'des':
          'this is description 4 nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn nnn',
      'pic':
          'https://eitrawmaterials.eu/wp-content/uploads/2019/05/Label-brochure-1.jpg'
    },
  ];
  late TeacherHomePageService service;
  var adsList;
  @override
  void onInit() async {
    // TODO: implement onInit
    service = TeacherHomePageService();
    adsList = await service.teacherAds();
    // print(adsList);

    if (adsList != null) {
      creatList();
    }

    super.onInit();
  }

  void refresh() async {
    service = TeacherHomePageService();
    adsList = await service.teacherAds();
    // print(adsList);
    creatList();

    Get.offAllNamed('/techermainpage');
    // Get.appUpdate();
    if (adsList != null) {}
  }

  List adsContents = [].obs;
  List adsImages = [].obs;
  creatList() {
    for (int i = 0; i < adsList.result.length; i++) {
      adsContents.add(adsList.result[i].content);
      adsImages.add(adsList.result[i].image);
    }
    for (int i = 0; i < adsList.result.length; i++) {
      // print(adsContents[i]);
      // print(adsImages[i]);
    }
  }
}
