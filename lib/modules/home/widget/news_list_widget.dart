import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pothipatra/modules/home/controller/home_controller.dart';
import 'package:pothipatra/modules/home/widget/news_list_item_widget.dart';
import 'package:pothipatra/routes/theme_app_pages.dart';

class NewsListWidget extends GetView<HomeController> {
  const NewsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.news.length > 10
              ? controller.news.length - 10
              : controller.news.length,
          itemBuilder: (context, index) {
            print(controller.news.length);
            return InkWell(
              onTap: () {
                controller.news.length > 10
                    ? controller.box!.write('postid',
                        controller.news[index + 10].postData!.id.toString())
                    : controller.box!.write('postid',
                        controller.news[index].postData!.id.toString());
                Get.toNamed(Routes.bookmarkDetail);
              },
              child: controller.news.length > 10
                  ? NewsCatItemWidget(
                      controller.news[index + 10],
                    )
                  : NewsCatItemWidget(
                      controller.news[index],
                    ),
            );
          });
    });
  }
}
