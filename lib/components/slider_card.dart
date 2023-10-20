import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  final String imageUrl;
  final Function() onTap;

  const SliderCard({Key? key, required this.imageUrl, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.23,
                fit: BoxFit.fill,
              )
              // CachedNetworkImage(
              //   fit: BoxFit.cover,
              //   height: 550,
              //   width: double.infinity,
              //   imageUrl: "$imageUrl",
              //   placeholder: (context, url) =>
              //       Center(child: CircularProgressIndicator()),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              // ),
              ),
        ],
      ),
    );
  }
}
