import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/components/Nav_Bar.dart';
import 'package:my_school/constant.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:my_school/modules/Teacher_Files/teacher_files.dart';
import 'package:my_school/modules/Teacher_Files/teacher_files_controller.dart';
import 'package:my_school/modules/Teacher_Upload_File/Teacher_upload_file_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class TeacherUploadFile extends StatelessWidget {
  @override
  var controller = Get.put(TeacherUploadFileController());
  TeacherFilesPageController controlller= new TeacherFilesPageController();

  void onClickUploded() async {
   
    EasyLoading.show(status: 'loading'.tr);

    if (controller.isselected.value && controller.isUpload.value) {
      await controller.UploadFileservice();
      if (controller.isuploded == true) {
        EasyLoading.showSuccess('File Uploded successfully'.tr);
            controlller.refresh();
           Get.toNamed('/teacher_files_page');
 
      } else {
        EasyLoading.showError('Uploaded failed'.tr);
      }
    } else if (controller.isselected == false ||
        controller.isUpload.value == false) {
      if (controller.isUpload.value == false &&
          controller.isselected == false) {
        EasyLoading.showError('please choose class and file'.tr);
      } else if (controller.isselected == false) {
        EasyLoading.showError('You Should select class'.tr);
      } else if (controller.isUpload.value == false) {
        EasyLoading.showError('You Should pick file '.tr);
      }
    }
 
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff7292CF),
                Color(0xff6688CA),
                Color(0xff476FBC),
                Color(0xff2855AE)
              ]),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/flowers_up.png'),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 25),
                        child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  DropdownSearch<String>(
                                    mode: Mode.MENU,
                                    showSelectedItems: true,
                                    items: controller.List_name,
                                    label:  "valid clases ".tr,
                                    hint: "Clases in menu mode".tr,
                                    popupItemDisabled: (String s) =>
                                        s.startsWith('I'),
                                    onChanged: (value) {
                                      controller.class_name = value;
                                      print(controller.class_name);

                                      controller.isselected.value = true;
                                      controller.take_id();
                                    },
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                  Obx(() {
                                    return GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue[200],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        child: Center(
                                            child: controller.isUpload.value ==
                                                    false
                                                ? Text(
                                                    'Click to explore file'.tr,
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.02),
                                                  )
                                                : Text(
                                                    'file is picked'.tr,
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.02),
                                                  )),
                                      ),
                                      onTap: () {
                                        controller.openFileExplorer();
                                      },
                                    );
                                  }),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                  TextFormField(
                                      controller:
                                          controller.decriptionController,
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                        hintText: 'Arabic Description'.tr,
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.amber,
                                          width: 1,
                                        )),
                                      )),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  TextFormField(
                                      controller:
                                          controller.decriptionControlleren,
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                        hintText: 'English Description'.tr,
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.amber,
                                          width: 1,
                                        )),
                                      )),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue[200],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          child: Center(
                                              child: Text(
                                            "Upload".tr,
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.normal,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02),
                                          )),
                                        ),
                                        onTap: () {
                                          onClickUploded();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
