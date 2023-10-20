import 'package:get/get.dart';
import 'package:my_school/student_app/modules/student_history/student_history_service.dart';
import 'package:intl/intl.dart';

import '../../../models/student_marks.dart';

class StudentHistoryController extends GetxController {
  StudentHistoryService service = StudentHistoryService();

  var evaloations;
  var evaloations_length = 0.obs;
  late var list_marks = [].obs;
  var quiz = [];
  var exam = [];
  var quizmarksatindex = 0;

  var is_loading = true.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    print(DateTime.now());
    print('datteeeeeeee: $formattedDate');
    evaloations = await service.evaloations();
    list_marks.value = await service.marks();
    // print(list_marks.length);
    // print(evaloations[2].created_at as String);

    evaloations_length.value = evaloations.length;

    // print(evaloations_length);

    // print(list_marks.value);
    // print(list_marks.length);
    // print(evaloations.length);
    print('ttttttttttttt');
    print(evaloations[1].createdAt);
    String formattedDatee =
        DateFormat('yyyy-MM-dd – kk:mm').format(evaloations[1].createdAt);
    print('ffffooorrrmmaaatedd:    $formattedDatee');
    print('ttttttttttttt');

    for (int i = 0; i < list_marks.value.length; i++) {
      print(list_marks.value[i].examMark);
      quizmarksatindex++;
      exam.add(list_marks[i].examMark);
      quiz.add(list_marks[i].quizeMark);
    }
    is_loading = false.obs;
    // print('qqq');
    // print(quizmarksatindex);
    super.onInit();
  }
}
