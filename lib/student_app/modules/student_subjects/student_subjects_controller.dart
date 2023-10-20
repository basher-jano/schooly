import 'package:get/get.dart';
import 'package:my_school/models/student_subject_model.dart';
import 'package:my_school/student_app/modules/student_subjects/student_subjects_service.dart';

class StudentSubjectsController extends GetxController {


StudentSubjectService service =StudentSubjectService();
List<Result> SubjectList=[];
var isLoading=true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady()async {
    SubjectList=await service.StudentSubject();
    isLoading(false);
    super.onReady();
  }

}
