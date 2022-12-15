import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pothipatra/common/color_utils.dart';
import 'package:pothipatra/models/news_model.dart';
import 'package:pothipatra/modules/global_widgets/sizes_box.dart';
import 'package:pothipatra/modules/news/controller/news_controller.dart';

// ignore: must_be_immutable
class AdsItemWidget extends GetView<NewsController> {
  News? news;
  AdsItemWidget({super.key, this.news});

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
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              news!.image.toString(),
              height: 200,
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            "Ads Screen",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
