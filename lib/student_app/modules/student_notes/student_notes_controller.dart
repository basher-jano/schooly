import 'package:get/get.dart';
import 'package:my_school/models/student_notes_model.dart';
import 'package:my_school/student_app/modules/student_notes/student_notes_service.dart';

class StudentNotesController extends GetxController {



var NotesList=[].obs;
var isLoading=true.obs;
StudentNotesService service=StudentNotesService();

@override
  void onInit() async{
     NotesList.value =await service.StudentNotes();
   isLoading(false);
    super.onInit();
  }


Future refresh()async{
   isLoading(true);
 NotesList.value =await service.StudentNotes();
   isLoading(false);
   onInit();

  
   
}




  @override
  void onReady() async{
  
    super.onReady();
  }

  void onTapSend(note) {

 service.sendnotes(note);
  refresh();

  }

}