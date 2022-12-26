import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:pothipatra/modules/global_widgets/font_style_util.dart';
import 'package:pothipatra/modules/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';

import '../../../common/color_utils.dart';

class PrivacyView extends GetView<ProfileController> {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    context.theme;
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Privacy Policy",
            style: context.textTheme.headline5,
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace_outlined,
                color: Get.isDarkMode
                    ? ColorUtilities.colorWhite
                    : ColorUtilities.colorBlack),
            onPressed: () => Get.back(),
          ),
          elevation: 0,
        ),
        body: controller.isLoading.isFalse
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: HtmlWidget(
                    controller.pages.value.content!.rendered.toString(),
                    textStyle: const TextStyle(
                        height: 2,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
              ),
      );
    });
  }
}
