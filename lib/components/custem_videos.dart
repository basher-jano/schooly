import 'package:flutter/material.dart';
import 'package:my_school/constant.dart';
import 'dart:async';

class CustemVideos extends StatelessWidget {
  final Function() onlongpress;
  final Function() ontap;
  final String desc;

  CustemVideos(
      {required this.onlongpress, required this.ontap, required this.desc});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ontap,
        onLongPress: onlongpress,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            color: alphaBluew,
            height: MediaQuery.of(context).size.height * 0.12,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: CircleAvatar(
                          child: Icon(
                        Icons.play_arrow,
                        size: 40,
                      ))),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      desc,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.020,
                      ),
                      maxLines: 3,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
