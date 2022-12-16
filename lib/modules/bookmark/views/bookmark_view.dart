import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pothipatra/common/asset_utils.dart';
import 'package:pothipatra/models/categories_model.dart';
import 'package:pothipatra/modules/bookmark/controller/bookmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:pothipatra/modules/home/widget/filter_bottom-sheet.dart';
import 'package:pothipatra/routes/theme_app_pages.dart';

import '../../../common/color_utils.dart';
import '../../global_widgets/font_style_util.dart';
import '../../global_widgets/sizes_box.dart';
import '../widget/bookmark_list_widget.dart';

class BookMarkView extends GetView<BookMarkController> {
  const BookMarkView({super.key});

  @override
  Widget build(BuildContext context) {
    context.theme;

    // TODO: implement build
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                Get.isDarkMode ? AssetUtilities.logoWhite : AssetUtilities.logo,
                width: 100,
              ),
              /*wSizedBox2,
                Text(controller.title.value,
                    style: FontStyleUtilities.f18(
                      fontColor: Get.isDarkMode
                          ? ColorUtilities.colorWhite
                          : ColorUtilities.colorBlack,
                      fontWeight: FWT.semiBold,
                    ))*/
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.search);
                },
                icon: Icon(
                  Icons.search,
                  color: ColorUtilities.colorPrimary,
                )),
            IconButton(
              onPressed: () {
                showMaterialModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    isDismissible: true,
                    //barrierColor: ColorUtilities.colorPrimary.withOpacity(0.1),
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext bc) {
                      return const MenuBottomItemWidget();
                    });
              },
              icon: Icon(
                Icons.filter_list,
                color: ColorUtilities.colorPrimary,
                size: 21,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: controller.isLoading.isFalse
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: const [
                    // SearchFieldWidget(
                    //   hintText: "Search",
                    //   keyboardType: TextInputType.phone,
                    //   onSaved: (input) => {},
                    //   labelText: "Search",
                    //   style: FontStyleUtilities.f14(
                    //       fontColor: ColorUtilities.colorPrimary,
                    //       fontWeight: FWT.medium),
                    //   onChanged: (value) => {},
                    //   validator: (input) =>
                    //       input != null && input.isEmpty ? "Please Search" : "",
                    //   suffix: true,
                    //   suffixIcon: Icon(
                    //     Icons.search,
                    //     color: ColorUtilities.logoBluecolor,
                    //     size: 18,
                    //   ),
                    // ),
                    // hSizedBox2,
                    /* controller.isLoading.isFalse
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      height: 40,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const ScrollPhysics(),
                          itemCount: controller.bookMarkCategories.length,
                          itemBuilder: (context, index) {
                            Category category =
                                controller.bookMarkCategories[index];
                            return InkWell(onTap: () {
                              controller.index.value = index;
                              controller
                                  .getBookMarkNews(category.termId.toString());
                            }, child: Obx(() {
                              return Container(
                                margin: const EdgeInsets.only(right: 10.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                decoration: BoxDecoration(
                                    color: controller.index.value == index
                                        ? ColorUtilities.colorPrimary
                                        : Get.isDarkMode
                                            ? ColorUtilities.colorBlack
                                            : ColorUtilities.colorWhite,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: controller.index.value == index
                                            ? ColorUtilities.colorPrimary
                                            : ColorUtilities.colorPrimaryLight,
                                        width: 1.5)),
                                child: Center(
                                  child: Obx(() {
                                    return Text(
                                      category.name.toString(),
                                      style: FontStyleUtilities.f13(
                                          fontColor:
                                              controller.index.value == index
                                                  ? ColorUtilities.colorWhite
                                                  : ColorUtilities
                                                      .colorPrimaryLight,
                                          fontWeight: FWT.regular),
                                      textAlign: TextAlign.center,
                                    );
                                  }),
                                ),
                              );
                            }));
                          }),
                    ),*/
                    hSizedBox1,
                    Expanded(child: BookmarkListWidget())
                  ],
                ),
        ),
      );
    });
  }
}
