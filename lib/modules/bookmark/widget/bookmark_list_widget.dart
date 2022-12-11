import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:pothipatra/routes/theme_app_pages.dart';
import '../controller/bookmark_controller.dart';
import 'bookmark_list_item_widget.dart';

class BookmarkListWidget extends GetView<BookMarkController> {
  const BookmarkListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          itemCount: controller.bookMarkNews.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  controller.box!.write('postid', controller.bookMarkNews[index].post!.iD.toString());
                  Get.toNamed(Routes.bookmarkDetail);
                },
                child: BookmarkListItemWidget(
                  news: controller.bookMarkNews[index],
                ));
          });
    });
  }
}
