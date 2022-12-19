import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pothipatra/common/string_extension.dart';
import 'package:pothipatra/services/auth_service.dart';

import '../../../common/asset_utils.dart';
import '../../../common/color_utils.dart';
import '../../global_widgets/font_style_util.dart';
import '../../global_widgets/sizes_box.dart';
import '../controller/bookmark_detail_controller.dart';

class BookMarkDetailView extends GetView<BookMarkDetailController> {
  @override
  Widget build(BuildContext context) {
    context.theme;
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back,
                  color: Get.isDarkMode
                      ? ColorUtilities.colorWhite
                      : ColorUtilities.colorBlack)),
          elevation: 0,
          centerTitle: false,
          title: Image.asset(
            Get.isDarkMode ? AssetUtilities.logoWhite : AssetUtilities.logo,
            width: 100,
          ),
        ),
        body: controller.isLoading.isFalse
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          controller.news.value.image.toString(),
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                      // hSizedBox2,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          hSizedBox2,
                          Row(
                            children: [
                              controller.news.value.category != null
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 3),
                                      decoration: BoxDecoration(
                                          color: ColorUtilities.colorWhite,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color:
                                                  ColorUtilities.colorPrimary,
                                              width: 1)),
                                      child: Text(
                                        controller.news.value.category![0].name
                                            .toString()
                                            .toTitleCase(),
                                        style: FontStyleUtilities.f13(
                                            fontColor:
                                                ColorUtilities.colorPrimary,
                                            fontWeight: FWT.regular),
                                      ),
                                    )
                                  : const SizedBox(),
                              // wSizedBox1,
                              // Icon(
                              //   Icons.remove_red_eye,
                              //   color: ColorUtilities.colorPrimary,
                              //   size: 18,
                              // ),
                              wSizedBox,
                              Text(
                                '',
                                style: FontStyleUtilities.f11(
                                    fontColor: Get.isDarkMode
                                        ? ColorUtilities.colorWhite
                                        : ColorUtilities.colorBlack,
                                    fontWeight: FWT.regular),
                              ),
                              wSizedBox1,
                              InkWell(
                                onTap: () async {
                                  if (!Get.find<AuthService>().isAuth) {
                                    controller.authCheck();
                                  } else {
                                    Map data = await controller.likeNews(
                                        controller.news.value.post!.iD
                                            .toString());
                                    if (data["like"]["msg"] == "Post Disike!") {
                                      controller.news.value.like = false;
                                      controller.news.value.likecount =
                                          (int.parse(controller
                                                      .news.value.likecount!) -
                                                  1)
                                              .toString();
                                      controller.news.refresh();
                                    } else {
                                      controller.news.value.like = true;
                                      controller.news.value.likecount =
                                          (int.parse(controller
                                                      .news.value.likecount!) +
                                                  1)
                                              .toString();
                                      controller.news.refresh();
                                    }
                                    // controller
                                    //     .likeNews(controller.news.value.post!.iD.toString());
                                  }
                                },
                                child: controller.news.value.like == false
                                    ? Icon(
                                        Icons.thumb_up_alt_outlined,
                                        color: ColorUtilities.colorPrimary,
                                        size: 18,
                                      )
                                    : Icon(
                                        Icons.thumb_up,
                                        color: ColorUtilities.colorPrimary,
                                        size: 18,
                                      ),
                              ),
                              wSizedBox,
                              Text(
                                controller.news.value.likecount!,
                                style: FontStyleUtilities.f11(
                                    fontColor: Get.isDarkMode
                                        ? ColorUtilities.colorWhite
                                        : ColorUtilities.colorBlack,
                                    fontWeight: FWT.regular),
                              ),
                            ],
                          ),
                          hSizedBox2,
                          Row(
                            children: [
                              // CircleAvatar(
                              //   radius: 30,
                              //   child: ClipRRect(
                              //     borderRadius: BorderRadius.circular(30),
                              //     child: Image.network(
                              //       controller.news.value.image.toString(),
                              //       width: 60,
                              //       height: 60,
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),
                              // wSizedBox1,
                              Expanded(
                                child: HtmlWidget(
                                  controller.news.value.post!.postTitle
                                      .toString(),
                                  textStyle: const TextStyle(
                                      height: 2,
                                      fontFamily: "Poppins",
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          hSizedBox1,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: HtmlWidget(
                              controller.news.value.post!.postContent
                                  .toString(),
                              textStyle: const TextStyle(
                                  height: 2,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ),
                          hSizedBox1,
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(12),
                          //   child: Image.network(
                          //     controller.news.value.image.toString(),
                          //     height: 200,
                          //     width: MediaQuery.of(context).size.width,
                          //     fit: BoxFit.fill,
                          //   ),
                          // ),
                          hSizedBox1,
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.symmetric(horizontal: 8.0),
                          //   child: HtmlWidget(
                          //     controller.news.value.post!.postContent
                          //         .toString(),
                          //     textStyle: const TextStyle(
                          //         height: 2,
                          //         fontFamily: "Poppins",
                          //         fontWeight: FontWeight.w400,
                          //         fontSize: 14),
                          //   ),
                          // ),
                          // hSizedBox2,
                          SizedBox(
                            height: 40,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const ScrollPhysics(),
                                itemCount:
                                    controller.news.value.category!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(onTap: () {
                                    controller.index.value = index;
                                  }, child: Obx(() {
                                    return Container(
                                      width: 110,
                                      margin: const EdgeInsets.only(right: 4.0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      decoration: BoxDecoration(
                                          color: controller.index.value == index
                                              ? ColorUtilities.colorPrimary
                                              : ColorUtilities.colorWhite,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: controller.index.value ==
                                                      index
                                                  ? ColorUtilities.colorWhite
                                                  : ColorUtilities.colorPrimary,
                                              width: 1.5)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Obx(() {
                                            return Text(
                                              "#${controller.news.value.category![index].name}",
                                              style: FontStyleUtilities.f13(
                                                  fontColor: controller
                                                              .index.value ==
                                                          index
                                                      ? ColorUtilities
                                                          .colorWhite
                                                      : ColorUtilities
                                                          .colorPrimary,
                                                  fontWeight: FWT.regular),
                                              textAlign: TextAlign.center,
                                            );
                                          })
                                        ],
                                      ),
                                    );
                                  }));
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
