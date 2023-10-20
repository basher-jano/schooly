
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:my_school/student_app/modules/student_home_page/student_home_page_service.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';








class StudentHomePageController extends GetxController {
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
  ];
  StudentHomePageService service = StudentHomePageService();
  var adsList;
  var adsList_length = 0.obs;
  List Adsfilelist=[];
  var isLoading = true.obs;


  @override
  void onInit() async {
    // TODO: implement onInit
    adsList = await service.studentAds();
    Adsfilelist=await service.StudentAdsFiles();
    adsList_length.value = adsList.length;
    isLoading(false);
    super.onInit();
  }

  Future openFile({String? url, String? fileName}) async {
    print("openFile clicked");

    final file = await downloadFile(url!, fileName!);

    if (file == null) return;

    print('Path: ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    print("downloadFile clicked");

    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    print(url);
    try {
      final respons = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(respons.data);
      await raf.close();

      return file;
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'The document cannot be opened because it is corrupted or damaged',
        backgroundColor: Color(0xff6688CA),
      );

      return null;
    }
  }
}
