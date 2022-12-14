import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:pothipatra/common/asset_utils.dart';
import 'package:pothipatra/modules/global_widgets/font_style_util.dart';
import 'package:pothipatra/modules/global_widgets/sizes_box.dart';
import 'package:pothipatra/modules/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';

import '../../../common/color_utils.dart';

class AboutView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    context.theme;
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "About Us",
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: controller.isLoading.isFalse
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        hSizedBox1,
                        HtmlWidget(
                          controller.pages.value.content!.rendered.toString(),
                          textStyle: TextStyle(
                              height: 2,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),

                        /* Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AssetUtilities.logo,
                      width: 100,
                    ),
                  ),
                  hSizedBox1,
                  const Text(
                    "Pothipatra",
                    style: TextStyle(fontSize: 18),
                  ),
                  hSizedBox1,
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      textAlign: TextAlign.center,
                      style: FontStyleUtilities.f14(
                          fontColor: Colors.grey, fontWeight: FWT.regular)),
                  hSizedBox4,
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                            children: [
                              const Icon(Icons.mail),
                              hSizedBox1,
                              const Text("abcde@gmail.com")
                            ],
                          )),
                      Container(
                        height: 60,
                        width: 1,
                        color: Colors.grey,
                      ),
                      Expanded(
                          child: Column(
                            children: [
                              const Icon(Icons.phone),
                              hSizedBox1,
                              const Text("+91 XXXXXXXXXXX")
                            ],
                          ))
                    ],
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Version: 1.0.0"),
                  )*/
                      ],
                    ),
            ),
          ));
    });
  }
}
