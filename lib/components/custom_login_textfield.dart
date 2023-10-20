import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/constant.dart';

class CustemLoginTextField extends StatelessWidget {
  final double width, hieght;
  final String hintText;
  final TextInputType? keyboard;
  final Function(String)? onchanged;
  final controller;
  const CustemLoginTextField({
    required this.hieght,
    required this.width,
    required this.hintText,
    this.onchanged,
    this.controller,
    this.keyboard,
    String? errorText,
  });

  @override
  Widget build(BuildContext context) {
    var obscure = true.obs;
    return Container(
      width: width,
      height: hieght,
      // decoration: BoxDecoration(
      //   color: black.withAlpha(40),
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      // ),
      child: Center(
        child: keyboard == TextInputType.visiblePassword
            ? Obx(
                () => TextField(
                  controller: controller,
                  onChanged: onchanged,
                  cursorColor: black,
                  keyboardType: keyboard ?? TextInputType.text,
                  style: TextStyle(
                    color: black,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                  ),
                  obscureText: keyboard == TextInputType.visiblePassword
                      ? obscure.value
                      : false,
                  decoration: InputDecoration(
                    label: Text(
                      hintText,
                      style: TextStyle(color: black),
                    ),
                    focusColor: black,
                    // border: InputBorder.none,
                    // enabledBorder: InputBorder.none,
                    focusedBorder: const UnderlineInputBorder(),
                    suffixIcon: keyboard == TextInputType.visiblePassword
                        ? Obx(
                            () => IconButton(
                                onPressed: () {
                                  obscure.value = !obscure.value;
                                  print(obscure.value);
                                },
                                icon: Icon(
                                  obscure == true
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                )),
                          )
                        : null,

                    hintStyle: TextStyle(
                      color: black,
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  ),
                ),
              )
            : TextField(
                controller: controller,
                onChanged: onchanged,
                cursorColor: black,
                keyboardType: keyboard ?? TextInputType.text,
                style: TextStyle(
                  color: black,
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                ),
                decoration: InputDecoration(
                  label: Text(
                    hintText,
                    style: TextStyle(color: black),
                  ),
                  focusColor: black,
                  // border: InputBorder.none,
                  // enabledBorder: InputBorder.none,
                  focusedBorder: const UnderlineInputBorder(),

                  hintStyle: TextStyle(
                    color: black,
                    fontSize: MediaQuery.of(context).size.height * 0.04,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                ),
              ),
      ),
    );
  }
}
