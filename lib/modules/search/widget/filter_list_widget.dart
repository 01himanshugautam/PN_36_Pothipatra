import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pothipatra/modules/search/controller/search_controller.dart';
import 'package:pothipatra/modules/search/widget/filter_list_item_widget.dart';
import 'package:pothipatra/routes/theme_app_pages.dart';

class FilterListWidget extends GetView<SearchController> {
  const FilterListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.filterNews.isEmpty
          ? const Center(child: Text("No Result Found"))
          : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              itemCount: controller.filterNews.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.box!.write('postid',
                        controller.filterNews[index].postData!.id.toString());
                    Get.toNamed(Routes.bookmarkDetail);
                  },
                  child: FilterListItemWidget(
                    controller.filterNews[index],
                  ),
                );
              });
    });
  }
}
