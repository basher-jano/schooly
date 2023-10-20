import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_school/modules/Teacher_Courses/upload_video.dart';
import 'package:my_school/modules/Teacher_Courses/upload_video_service.dart';
import 'package:my_school/models/teacher_upload_video_model.dart';

class UploadVideoController extends GetxController {
  TextEditingController decriptionController = TextEditingController();
  TextEditingController decriptionControlleren = TextEditingController();

  var isselected = false;

  var id;
  RxBool isdesc = false.obs;
  var isUpload = false.obs;
  List<PlatformFile>? files;
  UploadVideoService sevice = new UploadVideoService();
  late List<Result> list_clases;
  List<int> list_id = [];
  var isuploded;
  List<String> List_name = [];
  var class_name;
  @override
  void onInit() async {
    // TODO: implement onInit
    list_clases = await sevice.getClases();
    for (int i = 0; i < list_clases.length; i++) {
      list_id.add(list_clases[i].id!);
      List_name.add(list_clases[i].name!);
    }
    super.onInit();
  }

  void take_id() {
    int index = List_name.indexOf(class_name);
    id = list_id[index];
    print(id.toString() + 'iddd');
  }

  void openFileExplorer() async {
    files = (await FilePicker.platform.pickFiles(
            type: FileType.video,
            allowMultiple: false,
            allowedExtensions: null))!
        .files;
    isUpload.value = true;
  }

  void onrefresh() {
    isUpload.value = false;
    isselected = false;
  }

  UploadVideoservice() async {
    isuploded = await sevice.uploadVideo(
        files!, id, decriptionController.text, decriptionControlleren.text);
  }
}
