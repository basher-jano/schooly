import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/Teacher_Courses/techer_courses_service.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:my_school/models/techer_video_model.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoplayerController;
  TeacherCoursesService service = new TeacherCoursesService();
  late List<Result> videoteacherlist;
  List video_id = Get.arguments;
  RxList list_video = [].obs;
  ChewieController? chewieController;
  @override
  void onInit() async {
    print(video_id);
    videoteacherlist = await service.getVideo();
    for (int i = 0; i < videoteacherlist.length; i++) {
      if (video_id[0] == videoteacherlist[i].id) {
        list_video.add(videoteacherlist[i].video);
      }
    }
    // TODO: implement onInit

    super.onInit();
    initializeplayer(list_video);
  }

  @override
  void onClose() {
    // TODO: implement onClose
      videoplayerController.dispose();
  }

  Future<void> initializeplayer(List x) async {
    print(video_id[0]);
    print(list_video.value[0]);
    print(x[0] + 'x');
    videoplayerController = VideoPlayerController.network('${x[0]}');
    await Future.wait([videoplayerController.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: videoplayerController,
      autoPlay: true,
      looping: true,
      fullScreenByDefault: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: blueapp,
        handleColor: Colors.cyan,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.black,
      ),
      placeholder: Container(
        color: Colors.white,
      ),
      autoInitialize: true,
    );
    update();
  }
}
