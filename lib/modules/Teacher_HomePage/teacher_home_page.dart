import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/components/Nav_Bar.dart';
import 'package:my_school/components/custom_post.dart';
import 'package:my_school/components/slider_card.dart';
import 'package:my_school/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_school/modules/Teacher_HomePage/teacher_home_page_controller.dart';

class TeacherHomepage extends StatelessWidget {
  var controller = Get.put(TeacherHomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: background),
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    CarouselSlider.builder(
                      itemCount: controller.imgList.length,
                      carouselController: controller.sliderController,
                      itemBuilder: (context, item, index) {
                        return SliderCard(
                            imageUrl: controller.imgList[item], onTap: () {});
                      },
                      options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            controller.currentSliderIndex.value = index;
                          }),
                    ),
                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            controller.imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => controller.sliderController
                                .animateToPage(entry.key),
                            child: Container(
                                width: controller.currentSliderIndex.value ==
                                        entry.key
                                    ? 40
                                    : 12.0,
                                height: 12.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: controller
                                            .currentSliderIndex.value ==
                                        entry.key
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: alphaBluew)
                                    : const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white)),
                          );
                        }).toList(),
                      );
                    }),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.55,
                    decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: Obx(
                      () => controller.adsContents.obs == []
                          ? CircularProgressIndicator()
                          : ListView(
                              children: List.generate(
                              controller.adsContents.obs.length,
                              (index) => Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                                child: customPost(
                                  pic: controller.adsImages.obs[index],
                                  des: controller.adsContents.obs[index],
                                  onTab: () {
                                    Get.defaultDialog(
                                        title: 'description',
                                        content: Text(
                                          controller
                                              .adsList.result[index].content,
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                          ),
                                        ));
                                  },
                                ),
                              ),
                            )),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
