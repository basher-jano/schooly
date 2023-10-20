import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/config/user_information.dart';
import 'package:my_school/constant.dart';
import 'package:my_school/modules/splash/splash_controller.dart';

class Splash extends StatelessWidget {
  SplashController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
         // color: white,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 129, 157, 209),
                  Color.fromARGB(230, 200, 200, 200),
                  Color.fromARGB(255, 118, 148, 209),
                ]),
          ),
          
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(child: Image.asset('assets/images/Schooly.png',
            width:MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.35,)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Obx(
              () => controller.onORoff.value == false
                  ? Container()
                  : Column(
                      children: [
                        InkWell(
                          child: Column(
                            
                            children: [
                              Center(child: Text('Choose a language / اختر لغة',
                        style: TextStyle(
                           color:Color.fromARGB(255, 22, 107, 146),
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontFamily: 'Cairo',
                        ),),),
                               SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                              const Icon(
                                Icons.translate,
  color:Color.fromARGB(255, 22, 107, 146),                              ),
                              Obx((() => Text(
                                    controller.lang.value,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',   color:Color.fromARGB(255, 22, 107, 146),),
                                  )))
                            ],
                          ),
                          onTap: () {
                            controller.changeLang();
                          },
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: IconButton(
                              onPressed: () {
                                Get.toNamed('/loginas');
                              },
                              icon: Icon(
                                 Icons.arrow_forward,
  color:Color.fromARGB(255, 22, 107, 146),                                size: MediaQuery.of(context).size.height * 0.07,
                              )),
                        ),
                      ],
                    ),
            )
          ],
        ),
     
     
     
      ),
      
      ),
      
      
      
  
    );
  }
}
