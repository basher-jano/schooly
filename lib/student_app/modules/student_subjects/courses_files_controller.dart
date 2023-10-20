import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_school/models/student_sub_files_models.dart';
import 'package:my_school/models/student_video.dart';
import 'package:my_school/student_app/modules/student_subjects/courses_files_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class CoursesFilesController extends GetxController {
  var StudentFilesList = [];
  var isLoading = true.obs;
  StudentCoursesFilesService service = StudentCoursesFilesService();
  var listviedo = [].obs;
  var SubjectList2;
  var id;
  var nname;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    SubjectList2 = Get.arguments;
    id = SubjectList2.id;

    StudentFilesList = await service.StudentFiles(id);

    listviedo.value = await service.getVideo(id);
    isLoading(false);
  }

  @override
  void onReady() async {
    print('iiiid : ${id}');

    print('object');

    super.onReady();
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
