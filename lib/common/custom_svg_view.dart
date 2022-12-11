import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color_utils.dart';

// ignore: must_be_immutable
class CustomSvgView extends StatelessWidget {
  String? imageUrl;
  bool? isFromAssets = false;
  double? height = 24;
  double? width = 24;

  CustomSvgView({
    Key? key,
    this.imageUrl,
    this.isFromAssets,
    this.height,
    this.width,
  }) : assert(imageUrl != "" && imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return isFromAssets ?? false
        ? SvgPicture.asset(
            imageUrl!,
            height: height,
            width: width,
          )
        : SvgPicture.network(
            imageUrl!,
            height: height,
            width: width,
          );
  }
}
