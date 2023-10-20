import 'package:get/get.dart';
import 'package:my_school/models/techer_video_model.dart';
import 'package:my_school/modules/Teacher_Courses/techer_courses_service.dart';

class TeacherCoursesController extends GetxController {
  TeacherCoursesService service = new TeacherCoursesService();

  var videoteacherlist = [].obs;
  var list_name = [].obs;
  var list_name2 = [].obs;
  var list_id = [].obs;
  var list_id2 = [].obs;

  @override
  void onInit() async {
    videoteacherlist.value = await service.getVideo();
    // TODO: implement onInit
    super.onInit();
    for (int i = 0; i < videoteacherlist.value.length; i++) {
      list_name.add(videoteacherlist.value[i].grade!.name!);
      list_id.add(videoteacherlist.value[i].grade!.id!);
    }
    list_id2.value = list_id.value.toSet().toList();
    list_name2.value = list_name.value.toSet().toList();
    print(list_name2.value);
    print(list_id2.value);
   
  }
}
