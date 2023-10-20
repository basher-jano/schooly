import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import 'package:my_school/student_app/modules/student_subjects/video_controller.dart';

class VideoStudentScreen extends StatelessWidget {
  const VideoStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          GetBuilder<VideoStudentController>(
              init: VideoStudentController(),
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
                                Text('nodatafound'),
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
