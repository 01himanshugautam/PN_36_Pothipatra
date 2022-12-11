import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pothipatra/common/color_utils.dart';
import 'package:pothipatra/routes/theme_app_pages.dart';

import '../modules/global_widgets/font_style_util.dart';
import 'custom_button.dart';

class AuthPopup extends StatelessWidget {
  const AuthPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                alignment: Alignment.center,
                height: screenSize.height / 3,
                width: screenSize.width - 50,
                decoration: BoxDecoration(
                    color: ColorUtilities.colorWhite,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Authentication',
                        style: FontStyleUtilities.f20(
                          fontColor: ColorUtilities.colorBlack,
                          fontWeight: FWT.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Text(
                          'Please login first to access.',
                          textAlign: TextAlign.center,
                          style: FontStyleUtilities.f18(
                            fontColor: ColorUtilities.colorBlack,
                            fontWeight: FWT.regular,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            title: "Proceed",
                            height: 60,
                            isFlatButton: true,
                            buttonColor: ColorUtilities.colorBlack,
                            width: (screenSize.width / 2) - 50,
                            onButtonTap: () async {
                              Get.offAllNamed(Routes.login);
                            },
                          ),
                          CustomButton(
                            title: "Cancel",
                            width: (screenSize.width / 2) - 50,
                            isFlatButton: true,
                            height: 60,
                            buttonColor: Colors.red.shade800,
                            onButtonTap: () {
                              Get.back();
                            },
                          ),

                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
