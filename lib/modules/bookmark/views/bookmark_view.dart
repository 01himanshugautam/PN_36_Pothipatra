import 'package:get/get.dart';
import 'package:pothipatra/common/color_utils.dart';
import 'package:pothipatra/common/custom_button.dart';
import 'package:pothipatra/modules/bookmark/controller/bookmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:pothipatra/modules/bookmark/widget/bookmark_list_widget.dart';
import 'package:pothipatra/modules/global_widgets/font_style_util.dart';
import 'package:pothipatra/routes/theme_app_pages.dart';
import 'package:pothipatra/services/auth_service.dart';
import '../../global_widgets/sizes_box.dart';

class BookMarkView extends GetView<BookMarkController> {
  const BookMarkView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    context.theme;

    // TODO: implement build
    return Obx(() {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: controller.isLoading.isFalse
              ? const Center(child: CircularProgressIndicator())
              : controller.bookMarkNews.isEmpty
                  ? Get.find<AuthService>().isAuth != true
                      ? Center(
                          child: CustomButton(
                            title: "Login",
                            height: 60,
                            isFlatButton: true,
                            buttonColor: Get.isDarkMode
                                ? ColorUtilities.colorWhite
                                : ColorUtilities.colorBlack,
                            width: (screenSize.width / 2) - 50,
                            onButtonTap: () async {
                              Get.toNamed(Routes.login);
                            },
                          ),
                        )
                      : Center(
                          child: Text(
                          "No Results Found",
                          style: FontStyleUtilities.f13(
                              fontColor: Get.isDarkMode
                                  ? ColorUtilities.colorWhite
                                  : ColorUtilities.colorBlack,
                              fontWeight: FWT.regular),
                          textAlign: TextAlign.center,
                        ))
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

                        Expanded(child: BookmarkListWidget()),
                      ],
                    ),
        ),
      );
    });
  }
}
