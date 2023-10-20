import 'package:flutter/material.dart';

import '../constant.dart';

class customChooseType extends StatelessWidget {
  String pic;
  String type;
  Function() onTab;
  customChooseType({
    required this.type,
    required this.pic,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.36,
      height: MediaQuery.of(context).size.height * 0.229,
      child: InkWell(
        onTap: onTab,
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Image.asset(
                pic,
                width: MediaQuery.of(context).size.width * 0.31,
                height: MediaQuery.of(context).size.height * 0.17,
              ),
              Text(
                type,
                style: TextStyle(
                  color: white,
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontFamily: 'Cairo',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
