import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_school/models/teacher_files_model.dart';
import 'package:my_school/modules/Teacher_Files/teacher_files_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class TeacherFilesPageController extends GetxController {

List<Result> ListFiles=[];
var isLoading=true.obs;
var deleteload=true.obs;
TeacherFilesService service =TeacherFilesService();
@override
 void onReady() async{
   ListFiles=await service.teacherFiles();
   onInit();
     super.onReady();
  }

  @override
  Future onInit() async{

    
   ListFiles=await service.teacherFiles();
   
    isLoading(false);
        print('isloaddddin${isLoading}');

    super.onInit();
  }


  void refresh() async {
    print("اهييييييييييييييييييييييييييييييييييييييييييييييييية");
isLoading(true);
ListFiles=await service.teacherFiles();
isLoading(false);
onInit();


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
        gravity: ToastGravity.CENTER
        
      );
   
      return null;
      
    }
    
  }




void OnDeleteClicked(id){

 service.deletFiles(id);
deleteload(false);
   refresh() ;
}

}