import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pothipatra/modules/global_widgets/custom_swipe.dart';
import 'package:pothipatra/modules/news/controller/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    context.theme;
    return Obx(() {
      return controller.news.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : CupertinoPageScaffold(
              child: Stack(
              children: [
                CustomSwipe(
                  unlimitedUnswipe: true,
                  unswipe: () {},
                  controller: controller.swipeController,
                  cards: controller.newsItemListWidget,
                  padding: const EdgeInsets.all(20),
                  nextPage: () {
                    controller.initialPage = controller.initialPage + 1;
                    log("Next page ${controller.initialPage}");
                    controller.refreshNews(page: controller.initialPage);
                  },
                )
              ],
            ));
    });
  }
}
