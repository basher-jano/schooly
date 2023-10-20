import 'package:http/http.dart' as http;
import 'package:my_school/config/server_config.dart';
import 'package:my_school/config/user_information.dart';

class SplashService {
  var langUrl = UserInformation.LANG == 'العربية'
      ? Uri.parse(ServerConfig.DNS + ServerConfig.changeLang + '?Language=ar')
      : Uri.parse(ServerConfig.DNS + ServerConfig.changeLang + '?Language=en');
  Future changeLang() async {
    var langResponse = await http.get(langUrl, headers: {
      "Authorization": 'Bearer ${UserInformation.USER_TOKEN}',
    });
    
  }
}
