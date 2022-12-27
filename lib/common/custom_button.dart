import 'package:flutter/material.dart';
import 'package:pothipatra/common/color_utils.dart';

import '../modules/global_widgets/font_style_util.dart';

enum ButtonSize {
  small,
  medium,
  big,
}

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final bool isFlatButton;
  final Color buttonColor;
  final Color? textColor;
  final ButtonSize buttonSize;
  final VoidCallback onButtonTap;
  const CustomButton({
    Key? key,
    required this.height,
    required this.width,
    required this.title,
    this.textColor,
    this.isFlatButton = false,
    required this.buttonColor,
    this.buttonSize = ButtonSize.big,
    required this.onButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isFlatButton ? buttonColor : Colors.white,
          borderRadius: BorderRadius.circular((buttonSize == ButtonSize.big)
              ? 10
              : (buttonSize == ButtonSize.medium)
                  ? 10
                  : 7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: buttonSize == ButtonSize.small
                  ? FontStyleUtilities.f16(
                      fontColor: isFlatButton
                          ? textColor ?? ColorUtilities.colorAccent
                          : ColorUtilities.colorAccent,
                      fontWeight: FWT.semiBold,
                    )
                  : FontStyleUtilities.f15(
                      fontColor: isFlatButton
                          ? textColor ?? ColorUtilities.colorAccent
                          : ColorUtilities.colorWhite,
                      fontWeight: FWT.semiBold,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
