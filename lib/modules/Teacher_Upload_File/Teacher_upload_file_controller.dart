import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_school/models/teacher_upload_video_model.dart';
import 'package:my_school/modules/Teacher_Files/teacher_files_controller.dart';
import 'package:my_school/modules/Teacher_Upload_File/upload_file_service.dart';

class TeacherUploadFileController extends GetxController {
  TeacherFilesPageController controlller= new TeacherFilesPageController();
  var isUpload = false.obs;
  UploadFileServices service = new UploadFileServices();
  List<int> list_id = [];
  var isselected=false.obs;
  var id;
  var class_name;
  var isuploded;
  TextEditingController decriptionController = TextEditingController();
  TextEditingController decriptionControlleren = TextEditingController();
  List<String> List_name = [];
  late List<Result> list_clases;
  List<PlatformFile>? files;
  void openFileExplorer() async {
    files = (await FilePicker.platform.pickFiles(
            type: FileType.any, allowMultiple: false, allowedExtensions: null))!
        .files;
    print('loaded file path is:${files!.first.path}');
    isUpload.value = true;
  }

  void onInit() async {
    // TODO: implement onInit
    list_clases = await service.getClases();
    for (int i = 0; i < list_clases.length; i++) {
      list_id.add(list_clases[i].id!);
      List_name.add(list_clases[i].name!);
    }
    super.onInit();
    print(list_id);
    print(List_name);
  }

  void take_id() {
    print('ahmed mohamed ');
    int index = List_name.indexOf(class_name);
    id = list_id[index];
    print(id.toString() + 'iddd');
  }

  UploadFileservice() async {
    isuploded = await service.uploadFile(files!, id, decriptionController.text,decriptionControlleren.text);
    print(isuploded);
  }

void refresh(){
controlller.refresh();
}


}
