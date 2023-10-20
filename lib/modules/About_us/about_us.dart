import 'package:flutter/material.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/Schooly.png',
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
          Text('version 1.0.0',
              style: TextStyle(
                color: Color.fromARGB(255, 112, 14, 14),
                fontSize: MediaQuery.of(context).size.height * 0.023,
                fontFamily: "Cairo",
              )),
              Text("School Management System",
                                                          style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255, 24, 14, 112),
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.025,
                                                            fontFamily: "Cairo",
                                                            fontWeight: FontWeight.bold
                                                          )),
                                                          Row(children: [
                                                            Text('Powerd by:',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255, 24, 14, 112),
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.024,
                                                            fontFamily: "Cairo",
                                                          ))
                                                          ],),
                                                          Text('Ahmed Mohammed',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255, 24, 14, 112),
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.023,
                                                            fontFamily: "Cairo",
                                                          )),
                                                          Text('Anwer Sheikh Al-Ard',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255, 24, 14, 112),
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.023,
                                                            fontFamily: "Cairo",
                                                          )),
                                                          Text('Basher jano',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255, 24, 14, 112),
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.023,
                                                            fontFamily: "Cairo",
                                                          )),
                                                          Text('Riad Al-Kateeb',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255, 24, 14, 112),
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.023,
                                                            fontFamily: "Cairo",
                                                          )),
                                                          SizedBox(
                                                            height: MediaQuery.of(context).size.height*0.2,
                                                          ),
                                                          Text('All rights reserved 2022',
                                                          style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255, 24, 14, 112),
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.023,
                                                            fontFamily: "Cairo",
                                                          )),
        ],
      )),
    );
  }
}
