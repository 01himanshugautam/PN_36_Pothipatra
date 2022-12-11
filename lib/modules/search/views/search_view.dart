import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:pothipatra/modules/search/controller/search_controller.dart';

import '../../../common/color_utils.dart';
import '../../global_widgets/font_style_util.dart';
import '../../global_widgets/sizes_box.dart';
import '../widget/search_list_widget.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    context.theme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back,
                color: Get.isDarkMode
                    ? ColorUtilities.colorWhite
                    : ColorUtilities.colorBlack)),
        elevation: 0,
        centerTitle: false,
        title: Text("Search",
            style: FontStyleUtilities.f18(
                fontColor: Get.isDarkMode
                    ? ColorUtilities.colorWhite
                    : ColorUtilities.colorBlack,
                fontWeight: FWT.medium)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                hintText: 'Search Tech Talk',
              ),
              onSubmitted: (value) {
                controller.searchText = value;
                controller.getSearchNews();
              },
            ),
            hSizedBox1,
            // SizedBox(
            //   height: 35,
            //   child: ListView.builder(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       physics: const ScrollPhysics(),
            //       itemCount: controller.categories.length,
            //       itemBuilder: (context, index) {
            //         return InkWell(onTap: () {
            //           controller.index.value = index;
            //         }, child: Obx(() {
            //           return Container(
            //             width: 100,
            //             margin: const EdgeInsets.only(right: 4.0),
            //             decoration: BoxDecoration(
            //                 color: controller.index.value == index
            //                     ? ColorUtilities.colorPrimary
            //                     : Get.isDarkMode
            //                         ? ColorUtilities.colorBlack
            //                         : ColorUtilities.colorWhite,
            //                 borderRadius: BorderRadius.circular(30),
            //                 border: Border.all(
            //                     color: controller.index.value == index
            //                         ? ColorUtilities.colorPrimary
            //                         : ColorUtilities.colorPrimaryLight,
            //                     width: 1.5)),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 Obx(() {
            //                   return Text(controller.categories[index],
            //                       style: FontStyleUtilities.f14(
            //                           fontColor: controller.index.value == index
            //                               ? ColorUtilities.colorWhite
            //                               : ColorUtilities.colorPrimaryLight,
            //                           fontWeight: FWT.regular));
            //                 })
            //               ],
            //             ),
            //           );
            //         }));
            //       }),
            // ),
            // hSizedBox1,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Search Results"),
            //     TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           "1,0000 founds",
            //           style: FontStyleUtilities.f14(
            //               fontColor: ColorUtilities.colorPrimary,
            //               fontWeight: FWT.medium),
            //         ))
            //   ],
            // ),
            const Expanded(child: SearchListWidget())
          ],
        ),
      ),
    );
  }
}
