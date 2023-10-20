import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_school/config/server_config.dart';
import 'package:my_school/models/teacher_upload_video_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';

class UploadFileServices {
  Future<bool> uploadFile(List<PlatformFile> files, int grade_id, String desc,
      String descen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var url = Uri.parse(ServerConfig.DNS+ServerConfig.Uploadfile);
    var request = http.MultipartRequest('POST', url);
    request.files.add(
      await http.MultipartFile.fromPath('doucument', files.first.path!),
    );
    request.fields['grade_id'] = grade_id.toString();
    request.fields['en_description'] = descen;
    request.fields['ar_description'] = desc;
    request.headers['Authorization'] = 'Bearer    ${prefs.getString('token')}';
    request.headers['Accept'] = 'application/json';
    //  var respone = await request.send();
    /* respone.stream.transform(utf8.decoder).listen((value) {
      print('object');
      print(value);
      jsonresponse = jsonDecode(value);
      if(value.=true){

      }
    });*/
    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.body);
    var jsonresponse = jsonDecode(response.body);
    if (jsonresponse["isOk"] == true) {
      return true;
    } else
      return false;
  }

  getClases() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse(ServerConfig.DNS+ServerConfig.Teachergrades);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer    ${prefs.getString('token')}',
      'Accept': 'application/json'
    });
    print(response.statusCode);
    print(response.body);
    var jesonresponse = jsonDecode(response.body);
    if (jesonresponse['isOk'] == true) {
      var videoclases = TeacherclasesModle.fromJson(jesonresponse);
      return videoclases.result;
    }
  }
}
