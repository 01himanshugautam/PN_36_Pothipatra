import 'package:get/get.dart';
import 'package:pothipatra/common/color_utils.dart';
import 'package:pothipatra/modules/feed/controller/feed_controller.dart';
import 'package:flutter/material.dart';
import 'package:pothipatra/modules/feed/widget/feed_list_widget.dart';
import 'package:pothipatra/modules/global_widgets/font_style_util.dart';
import 'package:pothipatra/modules/global_widgets/sizes_box.dart';

class FeedView extends GetView<FeedController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ColorUtilities.colorWhite,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Latest"),
                TextButton(onPressed: () {}, child: Text("See All"))
              ],
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.index.value = index;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(controller.categories[index],
                                style: FontStyleUtilities.f14(
                                    fontColor: ColorUtilities.colorBlack,
                                    fontWeight: FWT.regular)),
                            hSizedBox,
                            Obx(() {
                              return Container(
                                width: 20,
                                height: 2,
                                color: controller.index.value == index
                                    ? ColorUtilities.colorPrimary
                                    : ColorUtilities.colorWhite,
                              );
                            })
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(child: FeedListWidget())
          ],
        ),
      ),
    );
  }
}
