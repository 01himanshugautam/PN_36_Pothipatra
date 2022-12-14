import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:pothipatra/common/auth_popup.dart';
import 'package:pothipatra/common/color_utils.dart';
import 'package:pothipatra/models/news_model.dart';
import 'package:pothipatra/modules/global_widgets/font_style_util.dart';
import 'package:pothipatra/modules/global_widgets/sizes_box.dart';
import 'package:pothipatra/modules/news/controller/news_controller.dart';
import 'package:pothipatra/services/auth_service.dart';

import '../../../common/asset_utils.dart';

// ignore: must_be_immutable
class NewsItemWidget extends GetView<NewsController> {
  News? news;
  NewsItemWidget({super.key, this.news});

  @override
  Widget build(BuildContext context) {
    context.theme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Get.isDarkMode
            ? ColorUtilities.backgroundColor
            : ColorUtilities.colorWhite,
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          hSizedBox2,
          // news!.ads == null
          //     ? const SizedBox()
          //     : Text("news!.ads!.the0!.postName!"),
          hSizedBox2,
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              news!.image.toString(),
              height: 200,
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hSizedBox1,
                  HtmlWidget(
                    news!.postData!.postTitle.toString(),
                    textStyle: TextStyle(
                        height: 2, fontFamily: "Poppins", fontSize: 16),
                  ),
                  hSizedBox1,
                  HtmlWidget(
                    news!.postData!.postContent.toString().substring(0, 450),
                    textStyle: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        height: 1.8,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  // Text(
                  //   news!.description.toString(),
                  //   style: FontStyleUtilities.f14(
                  //       fontColor: Get.isDarkMode
                  //           ? Colors.white60
                  //           : Colors.grey.shade700,
                  //       fontWeight: FWT.regular),
                  // ),
                ],
              ),
            ),
          ),
          hSizedBox2,
          Container(
            decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? ColorUtilities.backgroundColor
                  : ColorUtilities.colorWhite,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      if (!Get.find<AuthService>().isAuth) {
                        controller.authCheck();
                      } else {
                        Map data = await controller
                            .likeNews(news!.postData!.id.toString());
                        if (data["like"]["msg"] == "Post Disike!") {
                          news!.like = false;
                          controller.news.refresh();
                        } else {
                          news!.like = true;
                          controller.news.refresh();
                        }
                      }
                    },
                    child: news!.like == false
                        ? Icon(
                            Icons.thumb_up_alt_outlined,
                            color: ColorUtilities.logoOrangecolor,
                            size: 16,
                          )
                        : Icon(
                            Icons.thumb_up,
                            color: ColorUtilities.logoOrangecolor,
                            size: 16,
                          ),
                  ),
                  wSizedBox1,
                  InkWell(
                      onTap: () async {
                        if (!Get.find<AuthService>().isAuth) {
                          controller.authCheck();
                        } else {
                          Map response = await controller
                              .bookmarkNews(news!.postData!.id.toString());
                          if (response["bookmark"]["msg"] ==
                              "Bookmark added!") {
                            news!.bookmark2 = true;
                          } else {
                            news!.bookmark2 = false;
                          }
                          controller.news.refresh();
                        }
                      },
                      child: news!.bookmark2 == false
                          ? Icon(
                              Icons.bookmark_border,
                              color: ColorUtilities.kdarkGreyColor,
                            )
                          : SvgPicture.asset(AssetUtilities.bookmark,
                              height: 16,
                              width: 16,
                              color: ColorUtilities.colorPrimary))

                  // Text(news!.numberOfLikes.toString()),
                  // wSizedBox1,
                  // Container(
                  //   height: 10,
                  //   width: 1,
                  //   color: Colors.grey,
                  // ),
                  // wSizedBox1,
                  // Icon(
                  //   Icons.thumb_down,
                  //   size: 16,
                  //   color: Get.isDarkMode
                  //       ? ColorUtilities.colorWhite
                  //       : ColorUtilities.colorBlack,
                  // ),
                  // wSizedBox1,
                  //const Text("0")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
