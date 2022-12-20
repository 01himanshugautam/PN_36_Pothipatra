import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/instance_manager.dart';
import 'package:pothipatra/common/color_utils.dart';
import 'package:pothipatra/common/custom_button.dart';
import 'package:pothipatra/modules/global_widgets/font_style_util.dart';
import 'package:pothipatra/modules/global_widgets/sizes_box.dart';
import 'package:pothipatra/routes/theme_app_pages.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No Internet connection!",
            style: FontStyleUtilities.f18(
                fontColor: Get.isDarkMode
                    ? ColorUtilities.colorWhite
                    : ColorUtilities.colorBlack,
                fontWeight: FWT.regular),
            textAlign: TextAlign.center,
          ),
          hSizedBox3,
          CustomButton(
            title: "Retry",
            width: 100,
            isFlatButton: true,
            height: 50,
            buttonColor: Colors.red.shade800,
            onButtonTap: () {
              Get.offAndToNamed(
                Routes.splash,
              );
            },
          ),
        ],
      ),
    );
  }
}
