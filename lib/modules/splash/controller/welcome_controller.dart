import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pothipatra/services/auth_service.dart';
import '../../../routes/theme_app_pages.dart';

class WelcomeController extends GetxController {
  GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
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
