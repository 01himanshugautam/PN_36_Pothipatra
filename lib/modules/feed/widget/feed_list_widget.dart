import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pothipatra/modules/feed/controller/feed_controller.dart';

import 'feed_list_item_widget.dart';

class FeedListWidget extends GetView<FeedController> {
  const FeedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          itemCount: controller.feedList.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {},
                child: FeedListItemWidget(
                  feedItemModel: controller.feedList[index],
                ));
          });
    });
  }
}
