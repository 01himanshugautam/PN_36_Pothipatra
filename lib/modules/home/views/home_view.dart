import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pothipatra/common/color_utils.dart';
import 'package:pothipatra/models/categories_model.dart';
import 'package:pothipatra/modules/global_widgets/font_style_util.dart';
import 'package:pothipatra/modules/global_widgets/sizes_box.dart';
import 'package:pothipatra/modules/home/controller/home_controller.dart';
import 'package:pothipatra/modules/home/widget/news_list_widget.dart';
import 'package:pothipatra/routes/theme_app_pages.dart';
import '../widget/slider_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    context.theme;
    return Obx(() {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              hSizedBox1,
              CarouselSlider.builder(
                itemCount:
                    controller.news.length > 10 ? 10 : controller.news.length,
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.90,
                  autoPlay: true,
                  aspectRatio: 1,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return InkWell(
                      onTap: () {
                        controller.box!.write('postid',
                            controller.news[itemIndex].postData!.id.toString());
                        Get.toNamed(Routes.bookmarkDetail);
                      },
                      child: controller.news.isNotEmpty
                          ? SliderWidget(controller.news[itemIndex])
                          : Container());
                },
              ),
              // CarouselSlider(
              //   options: CarouselOptions(
              //     height: 200,
              //     viewportFraction: 0.90,
              //     autoPlay: true,
              //     aspectRatio: 1,
              //     enlargeCenterPage: true,
              //     enlargeStrategy: CenterPageEnlargeStrategy.height,
              //   ),
              //   items: controller.news.map(
              //     (item) {
              //       return InkWell(
              //           onTap: () {
              //             controller.box!
              //                 .write('postid', item.postData!.iD.toString());
              //             Get.toNamed(Routes.bookmarkDetail);
              //           },
              //           child: SliderWidget(item));
              //     },
              //   ).toList(),
              // ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("News",
                        style: FontStyleUtilities.f14(
                            fontColor: Get.isDarkMode
                                ? ColorUtilities.colorWhite
                                : ColorUtilities.colorBlack,
                            fontWeight: FWT.semiBold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0.0, 16, 8),
                child: controller.isLoading.isFalse
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        height: 40,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            itemCount: controller.categories.length,
                            itemBuilder: (context, index) {
                              Category category = controller.categories[index];
                              return InkWell(onTap: () {
                                controller.index.value = index;
                                controller.getNews(category.termId.toString());
                              }, child: Obx(() {
                                return Container(
                                  margin: const EdgeInsets.only(right: 10.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  decoration: BoxDecoration(
                                      color: controller.index.value == index
                                          ? ColorUtilities.colorPrimary
                                          : Get.isDarkMode
                                              ? ColorUtilities.colorBlack
                                              : ColorUtilities.colorWhite,
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: controller.index.value == index
                                              ? ColorUtilities.colorPrimary
                                              : ColorUtilities
                                                  .colorPrimaryLight,
                                          width: 1.5)),
                                  child: Obx(() {
                                    return Center(
                                      child: Text(
                                        category.name.toString(),
                                        style: FontStyleUtilities.f13(
                                            fontColor:
                                                controller.index.value == index
                                                    ? ColorUtilities.colorWhite
                                                    : ColorUtilities
                                                        .colorPrimaryLight,
                                            fontWeight: FWT.regular),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  }),
                                );
                              }));
                            }),
                      ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0.0, 6, 0),
                child: NewsListWidget(),
              )
            ],
          ),
        ),
      );
    });
  }
}
