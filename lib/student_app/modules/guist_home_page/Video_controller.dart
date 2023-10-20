import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/constant.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoController extends GetxController {
  @override
  late VideoPlayerController videoplayerController;
  ChewieController? chewieController;
  void onInit() {
    String VideoUrl = Get.arguments[0];
    print(VideoUrl);
    // TODO: implement onInit
    initializeplayer(VideoUrl);
    super.onInit();
  }

  void onClose() {
    // TODO: implement onClose
    videoplayerController.dispose();
  }

  Future<void> initializeplayer(String x) async {
    print(x[0] + 'x');
    videoplayerController = VideoPlayerController.network(x);
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
