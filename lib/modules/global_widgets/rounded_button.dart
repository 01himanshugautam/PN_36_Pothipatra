import 'package:flutter/material.dart';

import '../../common/color_utils.dart';
import 'font_style_util.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final VoidCallback press;
  final Color? color, textColor;
  double vertical = 10, horizontal = 0;
  RoundedButton({
    Key? key,
    this.text,
    required this.press,
    this.color = Colors.black,
    this.textColor = Colors.black,
    this.vertical = 10,
    this.horizontal = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: newElevatedButton(color),
      ),
    );
  }

  Widget newElevatedButton(Color? color) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          textStyle: TextStyle(
              color: ColorUtilities.colorPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w500)),
      child: Text(
        text.toString(),
        style: FontStyleUtilities.f16(
            fontColor: ColorUtilities.colorWhite, fontWeight: FWT.bold),
      ),
    );
  }
}
