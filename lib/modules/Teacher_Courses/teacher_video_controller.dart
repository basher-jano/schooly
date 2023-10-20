import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:my_school/models/techer_video_model.dart';
import 'package:my_school/modules/Teacher_Courses/techer_courses_service.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:async';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class TeacherVideosController extends GetxController {
  TeacherCoursesService service = new TeacherCoursesService();
  List argumentdate = Get.arguments;
  var videoteacherlist = [].obs;
  var list_des = [].obs;
  List<int> list_video_id = [];
  List<String> list_videoimage = [];
  var list_videoimage2 = [].obs;

  @override
  void onInit() async {
    videoteacherlist.value = await service.getVideo();
    for (int i = 0; i < videoteacherlist.value.length; i++) {
      if (videoteacherlist[i].grade!.id == argumentdate[0]) {
        list_des.add(videoteacherlist.value[i].description!);

        list_video_id.add(videoteacherlist.value[i].id!);
        list_videoimage.add(videoteacherlist.value[i].video!);
      }

      //
      print(list_des.value);
      print(list_des.value.length);
      // print(list_videoimage);

    }

    // print(argumentdate[1]);
    // TODO: implement onInit
    super.onInit();
  }

  void refresh() async {
    list_des.value = [];
    list_video_id = [];
    list_videoimage = [];
    videoteacherlist.value = await service.getVideo();
    for (int i = 0; i < videoteacherlist.length; i++) {
      if (videoteacherlist[i].grade!.id == argumentdate[0]) {
        list_des.add(videoteacherlist[i].description!);
        list_video_id.add(videoteacherlist[i].id!);
        list_videoimage.add(videoteacherlist[i].video!);
      }
    }
  }

  /*generateThumnail(String videourl) async {
    try {
      final thumnailFile = await VideoThumbnail.thumbnailFile(
          video: videourl, imageFormat: ImageFormat.PNG);
      list_videoimage2.add(thumnailFile!);
    } catch (e) {
      print(e);

      return null;
    }

    //
  }*/

/*  genThumbnailFile(String path) async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: path,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      maxHeight:
          100, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 75,
    );
    String file = fileName!;
    return file;
  }*/
  @override
  void onReady() {
    // TODO: implement onReady
    /*  for (int i = 0; i < videoteacherlist.length; i++) {
      if (videoteacherlist[i].grade!.id == argumentdate[0]) {
        list_des.add(videoteacherlist[i].description!);

        list_video_id.add(videoteacherlist[i].id!);
        list_videoimage.add(videoteacherlist[i].video!);
      }
      print(list_des);
      print(list_des.length);
      // print(list_videoimage);

    }*/

    super.onReady();
  }

  void DeleteVideoServuce(int id) {
    service.deletVideo(id);
    refresh();
  }
}
