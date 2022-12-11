import 'dart:async';
import 'package:get/get.dart';
import '../../../routes/theme_app_pages.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(seconds:3),
      () => Get.offAndToNamed(
        Routes.welcome,
      ),
    );
  }
}
