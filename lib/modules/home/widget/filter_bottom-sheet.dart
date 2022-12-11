import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pothipatra/models/city_model.dart';
import 'package:pothipatra/models/state_model.dart';
import 'package:pothipatra/modules/global_widgets/rounded_button.dart';
import 'package:pothipatra/modules/global_widgets/sizes_box.dart';
import 'package:pothipatra/modules/home/controller/home_controller.dart';
import 'package:pothipatra/routes/theme_app_pages.dart';

import '../../../common/color_utils.dart';
import '../../../models/categories_model.dart';
import '../../../models/place_model.dart';
import '../../global_widgets/font_style_util.dart';

class MenuBottomItemWidget extends GetView<HomeController> {
  const MenuBottomItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hSizedBox,
                  Text(
                    "State ",
                    style: FontStyleUtilities.f14(
                      fontColor: ColorUtilities.colorPrimary,
                      fontWeight: FWT.semiBold,
                    ),
                  ),
                  hSizedBox1,
                  DropdownButtonFormField<States>(
                    iconEnabledColor: ColorUtilities.colorPrimary,
                    iconDisabledColor: ColorUtilities.colorPrimary,
                    //onSaved: (input) => controller.filterCategory = input!,
                    style: FontStyleUtilities.f16(
                        fontColor: Get.isDarkMode
                            ? ColorUtilities.colorWhite
                            : ColorUtilities.colorBlack,
                        fontWeight: FWT.medium),

                    decoration: InputDecoration(
                      filled: true,
                      //fillColor: ColorUtilities.kdarkGreyColor,
                      labelStyle: FontStyleUtilities.f14(
                        fontColor: Get.isDarkMode
                            ? ColorUtilities.colorWhite
                            : ColorUtilities.colorBlack,
                        fontWeight: FWT.regular,
                      ),

                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    //value: controller.state,
                    isExpanded: true,
                    hint: Text(
                      "Select state",
                      style: FontStyleUtilities.f14(
                        fontColor: Get.isDarkMode
                            ? ColorUtilities.colorWhite
                            : ColorUtilities.colorBlack,
                        fontWeight: FWT.regular,
                      ),
                    ),

                    onChanged: (States? data) {
                      controller.filterState = data;
                      controller.citys(data!.termId.toString());
                    },
                    items: controller.state
                        .map<DropdownMenuItem<States>>((States value) {
                      return DropdownMenuItem<States>(
                        value: value,
                        child: Text(value.name.toString(),
                            style: FontStyleUtilities.f14(
                              fontColor: Get.isDarkMode
                                  ? ColorUtilities.colorWhite
                                  : ColorUtilities.colorBlack,
                              fontWeight: FWT.regular,
                            )),
                      );
                    }).toList(),
                  ),
                  hSizedBox2,
                  Text(
                    "City",
                    style: FontStyleUtilities.f14(
                      fontColor: ColorUtilities.colorPrimary,
                      fontWeight: FWT.semiBold,
                    ),
                  ),
                  hSizedBox1,
                  DropdownButtonFormField<City>(
                    iconEnabledColor: ColorUtilities.colorPrimary,
                    iconDisabledColor: ColorUtilities.colorPrimary,
                    //onSaved: (input) => controller.place = input!,
                    style: FontStyleUtilities.f16(
                        fontColor: Get.isDarkMode
                            ? ColorUtilities.colorWhite
                            : ColorUtilities.colorBlack,
                        fontWeight: FWT.medium),
                    decoration: InputDecoration(
                      filled: true,
                      //fillColor: ColorUtilities.kdarkGreyColor,
                      labelStyle: FontStyleUtilities.f14(
                        fontColor: Get.isDarkMode
                            ? ColorUtilities.colorWhite
                            : ColorUtilities.colorBlack,
                        fontWeight: FWT.regular,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    //value: controller.city,
                    hint: Text(
                      "Select city",
                      style: FontStyleUtilities.f14(
                        fontColor: Get.isDarkMode
                            ? ColorUtilities.colorWhite
                            : ColorUtilities.colorBlack,
                        fontWeight: FWT.regular,
                      ),
                    ),
                    isExpanded: true,
                    onChanged: (City? data) {
                      controller.filterCity = data;
                    },
                    items: controller.city
                        .map<DropdownMenuItem<City>>((City value) {
                      return DropdownMenuItem<City>(
                        value: value,
                        child: Text(value.name.toString(),
                            style: FontStyleUtilities.f14(
                              fontColor: Get.isDarkMode
                                  ? ColorUtilities.colorWhite
                                  : ColorUtilities.colorBlack,
                              fontWeight: FWT.regular,
                            )),
                      );
                    }).toList(),
                  ),
                  hSizedBox2,
                  RoundedButton(
                    vertical: 0,
                    color: ColorUtilities.colorPrimary,
                    press: () {
                      Get.back();
                      Get.toNamed(Routes.filter, arguments: [
                        controller.filterState!.name.toString(),
                        controller.filterState!.termId.toString(),
                        controller.filterCity!.name.toString(),
                        controller.filterCity!.termId.toString()
                      ]);
                    },
                    text: "Filter",
                  ),
                  hSizedBox1,
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
