import 'package:flutter/material.dart';

import 'package:my_school/constant.dart';

class CustomButton extends StatelessWidget {
  final double? width, hieght;
  final double? fontsize;
  final String? ButtonName;
  final Color? ButtonColor, fontcolor;
  final Function() ontap;
  CustomButton(
      {required this.width,
      required this.hieght,
      required this.ontap,
      required this.ButtonName,
      this.ButtonColor,
      this.fontcolor,
      this.fontsize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: hieght,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: background,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.16),
              Text(
                ButtonName!,
                style: TextStyle(
                    fontSize: fontsize ?? 20, color: fontcolor ?? white,fontFamily: 'Cairo',),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Icon(
                  Icons.arrow_forward,
                  color: white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
