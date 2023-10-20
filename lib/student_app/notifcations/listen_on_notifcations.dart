import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

void listenOnNotefcations() {
  FirebaseMessaging.onMessage.listen((event) {
    if (event.notification != null) {
      Get.snackbar(event.notification!.title!, event.notification!.body!);
      print( event.notification!.body!);
      print(event.notification!.body!);
    }
  });
  // void rifreshToken(){
  //   FirebaseMessaging.instance.onTokenRefresh
  // }
}
