import 'package:get/get.dart';
import 'package:my_school/models/class_student_model.dart';
import 'package:my_school/modules/Class/class_service.dart';


class ClassesController extends GetxController{

ClassesService service =ClassesService();
  var id ;
  var classesList2;
List<Result> StudentList=[];
var isLoading=true.obs;


@override
  void onInit() {
   classesList2=Get.arguments;
   id=classesList2.id;
    super.onInit();
  }

  @override
  void onReady()async {

     StudentList= await service.StudentClasses(id);
     isLoading(false);
      print('StudentList.length:  ${StudentList.length}');
      
  
    super.onReady();
  }
}