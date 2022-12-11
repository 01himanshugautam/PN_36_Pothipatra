import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget(
      {required Key key,
      required this.color,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final Color color;
  final Widget text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        color: color,
        disabledElevation: 0,
        disabledColor: Get.theme.focusColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: text,
        elevation: 0,
      ),
    );
  }
}
