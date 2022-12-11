import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/asset_utils.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
          child: Image.asset(
        Get.isDarkMode ? AssetUtilities.logoWhite : AssetUtilities.logo,
        width: 130,
        height: 130,
      )),
    );
  }
}
