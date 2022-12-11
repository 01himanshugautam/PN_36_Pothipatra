import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/asset_utils.dart';
import '../controller/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WelcomeController());
    return Scaffold(
      body: Center(
          child: Image.asset(
        AssetUtilities.wait,
      )),
    );
  }
}
