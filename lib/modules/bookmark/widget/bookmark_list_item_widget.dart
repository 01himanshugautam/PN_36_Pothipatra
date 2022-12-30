import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:pothipatra/common/image_url.dart';
import 'package:pothipatra/models/bookmark_model.dart';
import 'package:pothipatra/modules/bookmark/controller/bookmark_controller.dart';
import 'package:pothipatra/services/auth_service.dart';

import '../../../common/asset_utils.dart';
import '../../../common/color_utils.dart';
import '../../global_widgets/font_style_util.dart';
import '../../global_widgets/sizes_box.dart';

// ignore: must_be_immutable
class BookmarkListItemWidget extends GetView<BookMarkController> {
  Bookmark? news;
  BookmarkListItemWidget({super.key, this.news});

  @override
  Widget build(BuildContext context) {
    context.theme;

    return Container(
      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? ColorUtilities.backgroundColor
              : ColorUtilities.colorWhite,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: ColorUtilities.kdarkGreyColor, width: 0.5)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Image.network(
              ImageUrl().generateImageUrl(news!.image.toString()),
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HtmlWidget(
                    news!.post!.postTitle.toString(),
                    textStyle: const TextStyle(
                      height: 1.5,
                    ),
                  ),
                  // Text(news!.post!.postTitle.toString(),
                  //     maxLines: 2,
                  //     style: FontStyleUtilities.f13(
                  //         fontColor: Get.isDarkMode
                  //             ? ColorUtilities.colorWhite
                  //             : ColorUtilities.colorBlack,
                  //         fontWeight: FWT.medium)),
                  hSizedBox,

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
                                        .likeNews(news!.post!.iD.toString());
                                    if (data["like"]["msg"] == "Post Disike!") {
                                      news!.like = false;
                                      news!.likecount =
                                          (int.parse(news!.likecount!) - 1)
                                              .toString();
                                      controller.bookMarkNews.refresh();
                                    } else {
                                      news!.like = true;
                                      news!.likecount =
                                          (int.parse(news!.likecount!) + 1)
                                              .toString();
                                      controller.bookMarkNews.refresh();
                                    }
                                    //controller.likeNews(news!.post!.iD.toString());
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
                                      )),
                            wSizedBox,
                            Text(
                              news!.likecount.toString(),
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
                              news!.post!.commentCount.toString(),
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
                                    .bookmarkNews(news!.post!.iD.toString());
                                if (response["bookmark"]["msg"] ==
                                    "Bookmark added!") {
                                  news!.bookmark2 = true;
                                } else {
                                  news!.bookmark2 = false;
                                }
                                controller.bookMarkNews.refresh();
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
