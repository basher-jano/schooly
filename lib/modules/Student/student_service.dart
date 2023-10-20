import 'dart:convert';

import 'package:my_school/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StudentServise{
 var message;
Future<String> evaluatstudent(id,note,type)async {
 
var url =
        Uri.parse(ServerConfig.DNS+ServerConfig.evaluat_student+'${id}'+'&note='+note+'&evaluation_type='+'${type}');
        print(url);
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${prefs.getString('token')}',
        'Accept': 'application/json'
      },
      
   
    );

     print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isOk'] == true) {
        var message = jsonResponse['result'];
       

        return message ;
      } else {
        return message  ;
      }
    } else
      return message ;
}

}