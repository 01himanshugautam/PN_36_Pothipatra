import 'dart:async';
import 'package:get/get.dart';
import 'package:pothipatra/services/auth_service.dart';
import '../../../routes/theme_app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Timer(
    //   const Duration(seconds: 3),
    //   () => Get.offAndToNamed(
    //     Routes.welcome,
    //   ),
    // );
    Timer(const Duration(seconds: 2), () {
      if (!Get.find<AuthService>().isAuth) {
        Get.offAndToNamed(
          Routes.root,
        );
      } else {
        Get.offAndToNamed(
          Routes.root,
        );
      }
    });
  }
}
