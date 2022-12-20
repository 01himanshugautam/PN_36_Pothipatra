import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pothipatra/models/pages.dart';
import 'package:pothipatra/modules/global_widgets/ui.dart';
import 'package:pothipatra/repositories/category_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/cancel_popup.dart';
import '../../../services/auth_service.dart';

class ProfileController extends GetxController {
  final selectedThemeMode = ThemeMode.light.obs;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var pages = Pages().obs;
  final isLoading = false.obs;
  GetStorage? box;
  CategoryRepository? categoryRepository;

  ProfileController() {
    categoryRepository = CategoryRepository();

    box = GetStorage();
  }

  @override
  Future<void> onInit() async {
    initThemeMode();
    await Get.find<AuthService>().checkUserLogin();
    await Get.find<AuthService>().getCurrentUser();
    super.onInit();
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(
        'https://play.google.com/store/apps/details?id=com.app.pothipatra'))) {
      throw 'Could not launch';
    }
  }

  void initThemeMode() {
    if (box != null) {
      String? themeMode = box!.read<String>('theme_mode');
      switch (themeMode) {
        case 'ThemeMode.light':
          selectedThemeMode.value = ThemeMode.light;
          break;
        case 'ThemeMode.dark':
          selectedThemeMode.value = ThemeMode.dark;
          break;
        case 'ThemeMode.system':
          selectedThemeMode.value = ThemeMode.system;
          break;
        default:
          selectedThemeMode.value = ThemeMode.system;
      }
    } else {
      selectedThemeMode.value = ThemeMode.light;
    }
  }

  void changeThemeMode(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
    selectedThemeMode.value = themeMode;
    if (themeMode == ThemeMode.dark) {
      //Get.rootController.setTheme(Get.find<SettingsService>().getDarkTheme());
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark
            .copyWith(systemNavigationBarColor: Colors.black87),
      );
    } else {
      //Get.rootController.setTheme(Get.find<SettingsService>().getLightTheme());
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light
            .copyWith(systemNavigationBarColor: Colors.white),
      );
    }
    box!.write('theme_mode', themeMode.toString());
    Get.rootController.refresh();
  }

  Future getPages(id) async {
    try {
      isLoading.value = false;
      pages.value = await categoryRepository!.getPages(id);
      isLoading.value = true;
    } catch (e) {
      // Get.showSnackbar(Ui.errorSnackBar(message: e.toString()));
    } finally {
      isLoading.value = true;
    }
  }

  logout() {
    return showDialog(
        context: Get.context!, builder: (context) => const CanclePopup());
  }
}
