import 'package:flutter/material.dart';
import 'package:my_school/constant.dart';

class infoList extends StatelessWidget {
  final String title;
  final String content;
  infoList({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      color: alphaBluew,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(
            //     height: MediaQuery.of(context).size.height *
            //         0.01),
            Text(
              title,
              style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
            // SizedBox(
            //     height: MediaQuery.of(context).size.height *
            //         0.02),
            Text(
              content,
              style: TextStyle(
                  color: black.withAlpha(120),
                  fontSize: MediaQuery.of(context).size.height * 0.018),
            )
          ],
        ),
      ),
    );
  }
}
