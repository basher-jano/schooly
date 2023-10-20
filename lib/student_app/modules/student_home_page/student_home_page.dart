import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_school/components/custom_post.dart';
import 'package:my_school/components/slider_card.dart';
import 'package:my_school/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_school/student_app/modules/student_home_page/student_home_page_controller.dart';

class StudentHomepage extends StatelessWidget {
  var controller = Get.put(StudentHomePageController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: blueapp,
            appBar: AppBar(
              backgroundColor: white.withOpacity(0),
              elevation: 0,
              toolbarHeight: 0,
              bottom: TabBar(
                  unselectedLabelColor: white.withOpacity(0.5),
                  labelColor: white,
                  indicatorColor: white,
                  tabs: [
                    Tab(
                      text: 'Advertisement'.tr,
                    ),
                    Tab(
                      text: 'files'.tr,
                    )
                  ]),
            ),
            body: TabBarView(children: [
              SafeArea(
                child: Container(
                  decoration: BoxDecoration(gradient: background),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                            CarouselSlider.builder(
                              itemCount: controller.imgList.length,
                              carouselController: controller.sliderController,
                              itemBuilder: (context, item, index) {
                                return SliderCard(
                                    imageUrl: controller.imgList[item],
                                    onTap: () {});
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
                                children: controller.imgList
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  return GestureDetector(
                                    onTap: () => controller.sliderController
                                        .animateToPage(entry.key),
                                    child: Container(
                                        width: controller
                                                    .currentSliderIndex.value ==
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                              () => controller.adsList_length == 0
                                  ? Container()
                                  : ListView(
                                      children: List.generate(
                                      controller.adsList_length.value,
                                      (index) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        child: customPost(
                                          pic: controller.adsList[index].image,
                                          des:
                                              controller.adsList[index].content,
                                          onTab: () {
                                            Get.defaultDialog(
                                                title: 'description',
                                                content: Text(
                                                  controller.posts[index]
                                                      ['des']!,
                                                  style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                  ),
                                                ));
                                          },
                                        ),
                                      ),
                                    )),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  //files
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff7292CF),
                          Color(0xff6688CA),
                          Color(0xff476FBC),
                          Color(0xff2855AE)
                        ]),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.75,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50))),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 25),
                                  child: Obx(() {
                                    if (controller.isLoading == true) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (controller.Adsfilelist.isEmpty) {
                                      return Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/icons/no-results.png',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                          ),
                                          Text('no Files found !'.tr,
                                              style: TextStyle(
                                                  color: Colors.blue[400],
                                                  fontSize: 18.0,
                                                  fontFamily: 'Cairo',
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ],
                                      ));
                                    } else {
                                      return GridView.builder(
                                          itemCount: controller
                                              .Adsfilelist.length,
                                          gridDelegate:
                                              SliverGridDelegateWithMaxCrossAxisExtent(
                                                  maxCrossAxisExtent: 200,
                                                  childAspectRatio: 15 / 14,
                                                  crossAxisSpacing: 20,
                                                  mainAxisSpacing: 20),
                                          itemBuilder: (BuildContext, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                OnPdfClicked(
                                                  controller
                                                      .Adsfilelist[index]
                                                      .file,
                                                );
                                              },
                                              child: Card(
                                                elevation: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffF5F6FC),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: 100,
                                                        child: Image.asset(
                                                          'assets/icons/pdf-file.png',
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.015,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.015,
                                                      ),
                                                      Center(
                                                          child: Text(
                                                        controller
                                                            .Adsfilelist[
                                                                index]
                                                            .content,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Cairo'),
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  })),
                            ))
                      ],
                    ),
                  ))
            ])

            /////////////////////////
            ));
  }
   OnPdfClicked(String? url) {
    controller.openFile(
      url: url,
      fileName: 'name.pdf',
    );
  }
}
