import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pothipatra/common/asset_utils.dart';
import 'package:pothipatra/common/color_utils.dart';
import 'package:pothipatra/common/image_url.dart';
import 'package:pothipatra/models/news_model.dart';
import 'package:pothipatra/modules/global_widgets/font_style_util.dart';
import 'package:pothipatra/modules/global_widgets/sizes_box.dart';
import 'package:pothipatra/modules/home/controller/home_controller.dart';
import 'package:pothipatra/services/auth_service.dart';

// ignore: must_be_immutable
class NewsCatItemWidget extends GetView<HomeController> {
  News news;
  NewsCatItemWidget(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? ColorUtilities.backgroundColor
              : ColorUtilities.colorWhite,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: ColorUtilities.kdarkGreyColor, width: 0.5)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Image.network(
              ImageUrl().generateImageUrl(news.image.toString()),
              width: 110,
              height: 110,
              fit: BoxFit.fill,
            ),
          ),
          wSizedBox1,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // hSizedBox1,

                  Text(
                    news.postData!.postTitle.toString(),
                    maxLines: 2,
                    style: const TextStyle(height: 1.5),
                  ),
                  // Row(
                  //   children: const [
                  //     // ClipRRect(
                  //     //   borderRadius: BorderRadius.circular(40),
                  //     //   child: Image.asset(
                  //     //     AssetUtilities.bbcnews,
                  //     //     width: 20,
                  //     //     fit: BoxFit.cover,
                  //     //   ),
                  //     // ),
                  //     // wSizedBox,
                  //     // Text(
                  //     //   "header",
                  //     //   style: FontStyleUtilities.f11(
                  //     //       fontColor: Get.isDarkMode
                  //     //           ? ColorUtilities.colorWhite
                  //     //           : ColorUtilities.colorBlack,
                  //     //       fontWeight: FWT.semiBold),
                  //     // ),
                  hSizedBox,
                  //     /* news.category!.isNotEmpty?
                  //     Container(
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 10, vertical: 2),
                  //       decoration: BoxDecoration(
                  //           color: ColorUtilities.colorWhite,
                  //           borderRadius: BorderRadius.circular(30),
                  //           border: Border.all(
                  //               color: ColorUtilities.logoOrangecolor,
                  //               width: 1)),
                  //       child: Text(
                  //         news.category![0].name.toString(),
                  //         textAlign: TextAlign.center,
                  //         style: FontStyleUtilities.f11(
                  //             fontColor: ColorUtilities.logoOrangecolor,
                  //             fontWeight: FWT.regular),
                  //       ),
                  //     ):
                  //     const SizedBox(),*/
                  //   ],
                  // ),
                  // hSizedBox2,
                  // Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () async {
                                  if (!Get.find<AuthService>().isAuth) {
                                    controller.authCheck();
                                  } else {
                                    Map data = await controller
                                        .likeNews(news.postData!.id.toString());
                                    if (data["like"]["msg"] == "Post Disike!") {
                                      news.like = false;
                                      news.likecount =
                                          (int.parse(news.likecount!) - 1)
                                              .toString();
                                      controller.news.refresh();
                                    } else {
                                      news.like = true;
                                      news.likecount =
                                          (int.parse(news.likecount!) + 1)
                                              .toString();
                                      controller.news.refresh();
                                    }
                                  }
                                },
                                child: news.like == false
                                    ? Icon(
                                        Icons.thumb_up_alt_outlined,
                                        color: ColorUtilities.logoOrangecolor,
                                        size: 16,
                                      )
                                    : Icon(
                                        Icons.thumb_up,
                                        color: ColorUtilities.logoOrangecolor,
                                        size: 16,
                                      )),
                            wSizedBox,
                            Text(
                              news.likecount.toString(),
                              style: FontStyleUtilities.f11(
                                  fontColor: Get.isDarkMode
                                      ? ColorUtilities.colorWhite
                                      : ColorUtilities.colorBlack,
                                  fontWeight: FWT.regular),
                            ),
                            /*wSizedBox1,
                            Icon(
                              Icons.comment,
                              color: ColorUtilities.logoOrangecolor,
                              size: 16,
                            ),
                            wSizedBox,
                            Text(
                              news.postData!.commentCount.toString(),
                              style: FontStyleUtilities.f11(
                                  fontColor: Get.isDarkMode
                                      ? ColorUtilities.colorWhite
                                      : ColorUtilities.colorBlack,
                                  fontWeight: FWT.regular),
                            ),*/
                          ],
                        ),
                        InkWell(
                            onTap: () async {
                              if (!Get.find<AuthService>().isAuth) {
                                controller.authCheck();
                              } else {
                                Map response = await controller
                                    .bookmarkNews(news.postData!.id.toString());
                                if (response["bookmark"]["msg"] ==
                                    "Bookmark added!") {
                                  news.bookmark2 = true;
                                } else {
                                  news.bookmark2 = false;
                                }
                                controller.news.refresh();
                                // controller
                                //     .bookmarkNews(news.postData!.iD.toString());
                              }
                            },
                            child: news.bookmark2 == false
                                ? Icon(
                                    Icons.bookmark_border,
                                    color: ColorUtilities.kdarkGreyColor,
                                  )
                                : SvgPicture.asset(AssetUtilities.bookmark,
                                    height: 16,
                                    width: 16,
                                    color: ColorUtilities.colorPrimary))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
