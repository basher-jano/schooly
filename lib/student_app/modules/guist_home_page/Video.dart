import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/student_app/modules/guist_home_page/Video_controller.dart';
import 'package:chewie/chewie.dart';

class VideoGuest extends StatelessWidget {
  const VideoGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          GetBuilder<VideoController>(
              init: VideoController(),
              builder: (controller) {
                return Expanded(
                  child: Center(
                      child: controller.chewieController != null &&
                              controller.chewieController!.videoPlayerController
                                  .value.isInitialized
                          ? Chewie(
                              controller: controller.chewieController!,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('loading'),
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )),
                );
              })
        ],
      )),
    );
  }
}
