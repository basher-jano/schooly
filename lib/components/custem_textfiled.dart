import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_school/constant.dart';

class CustemText extends StatelessWidget {
  final double width, hieght;
  final String hintText;
  final TextInputType? keyboard;
  // final Function(String) onchanged;
  final controller;
  const CustemText({
    required this.hieght,
    required this.width,
    required this.hintText,
    // this.onchanged,
    this.controller,
    this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hieght,
      decoration: BoxDecoration(
        color: black.withAlpha(40),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          // onChanged: onchanged,
          cursorColor: black,

          keyboardType: keyboard ?? TextInputType.text,
          style: TextStyle(
              color: black, fontSize: 20, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8)),
        ),
      ),
    );
  }
}
