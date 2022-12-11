import 'package:get/get.dart';

import '../controller/theme_mode_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeModeController>(
      () => ThemeModeController(),
    );
    // TODO: implement dependencies
  }
}
