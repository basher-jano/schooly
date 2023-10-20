import 'package:get/get.dart';
import 'package:my_school/models/teacher_classes_model.dart';
import 'package:my_school/modules/Teacher_Classes/teacher_classes_service.dart';

class TeacherClassesController extends GetxController{
List<Class> classesList=[];
TeacherClassesService service = new TeacherClassesService();
@override
  void onInit()async {
    super.onInit();
  }


  @override
  void onReady() async{
   classesList= await service.teacherClasses();
    // print('classesList.length:  ${classesList.length}');
  
    super.onReady();


    
  }
}