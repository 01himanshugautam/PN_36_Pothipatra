import 'package:get/get.dart';

import '../controller/theme_mode_controller.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeModeController>(
      () => ThemeModeController(),
    );
    // TODO: implement dependencies
  }
}
