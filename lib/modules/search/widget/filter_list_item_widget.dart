import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:pothipatra/common/asset_utils.dart';
import 'package:pothipatra/common/color_utils.dart';
import 'package:pothipatra/models/filterNewsResponseModel.dart';
import 'package:pothipatra/modules/global_widgets/font_style_util.dart';
import 'package:pothipatra/modules/global_widgets/sizes_box.dart';
import 'package:pothipatra/modules/search/controller/search_controller.dart';
import 'package:pothipatra/services/auth_service.dart';

// ignore: must_be_immutable
class FilterListItemWidget extends GetView<SearchController> {
  FilterNewsResponseModel news;
  FilterListItemWidget(this.news, {super.key});

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
        children: [
          news.image == "false"
              ? ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Image.asset(
                    Get.isDarkMode
                        ? AssetUtilities.logoWhite
                        : AssetUtilities.logo,
                    width: 110,
                    height: 110,
                    fit: BoxFit.fill,
                  ))
              : ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Image.network(
                    news.image.toString(),
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HtmlWidget(
                    news.postData!.postTitle.toString(),
                    textStyle: TextStyle(
                      height: 1.5,
                      color: Get.isDarkMode
                          ? ColorUtilities.colorWhite
                          : ColorUtilities.colorBlack,
                    ),
                  ),
                  hSizedBox1,
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
                                      controller.searchNews.refresh();
                                    } else {
                                      news.like = true;
                                      news.likecount =
                                          (int.parse(news.likecount!) + 1)
                                              .toString();
                                      controller.searchNews.refresh();
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
                            /* wSizedBox1,
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
                                  news.bookmark = true;
                                } else {
                                  news.bookmark = false;
                                }
                                controller.searchNews.refresh();
                              }
                            },
                            child: news.bookmark == false
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
