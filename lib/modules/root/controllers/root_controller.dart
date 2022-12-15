import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pothipatra/modules/bookmark/controller/bookmark_controller.dart';
import 'package:pothipatra/modules/bookmark/views/bookmark_view.dart';
import 'package:pothipatra/modules/home/controller/home_controller.dart';
import 'package:pothipatra/modules/home/views/home_view.dart';
import 'package:pothipatra/modules/news/controller/news_controller.dart';
import 'package:pothipatra/modules/news/views/news_view.dart';
import 'package:pothipatra/modules/profile/controller/profile_controller.dart';
import 'package:pothipatra/modules/profile/views/profile_view.dart';

import '../../../routes/theme_app_pages.dart';
import '../../../services/auth_service.dart';

class RootController extends GetxController {
  final currentIndex = 1.obs;
  final title = "News".obs;

  String state = "Rajsthan";
  List<String> stateItems = [
    'Rajsthan',
    'Ajmer',
    'Sikar',
  ];

  String city = "Ajmer";
  List<String> cityItems = [
    'Ajmer',
    'Jaipur',
    'Ringus',
  ];

  RootController();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    await Get.find<AuthService>().checkUserLogin();
    await Get.find<AuthService>().getCurrentUser();

    super.onInit();
  }

  List<Widget> pages = [
    const HomeView(),
    const NewsView(),
    const BookMarkView(),
    const ProfileView(),
  ];

  List<String> titleNames = [
    "Home",
    "News",
    "Bookmark",
    "Profile",
  ];

  Widget get currentPage => pages[currentIndex.value];

  Future<void> changePageInRoot(int index) async {
    currentIndex.value = index;
    await refreshPage(index);
  }

  Future<void> changePageOutRoot(int index) async {
    currentIndex.value = index;
    await refreshPage(index);
    await Get.offNamedUntil(Routes.root, (Route route) {
      if (route.settings.name == Routes.root) {
        return true;
      }
      return false;
    }, arguments: index);
  }

  Future<void> changePage(int index) async {
    if (index == 0) {}
    if (Get.currentRoute == Routes.root) {
      await changePageInRoot(index);
      title.value = titleNames[index];
    } else {
      await changePageOutRoot(index);
    }
  }

  Future<void> refreshPage(int index) async {
    switch (index) {
      case 0:
        {
          await Get.find<HomeController>().refreshHome();
          break;
        }
      case 1:
        {
          await Get.find<NewsController>().refreshNews();
          break;
        }
      case 2:
        {
          await Get.find<BookMarkController>().refreshCategory();
          break;
        }
      case 3:
        {
          Get.find<ProfileController>();
          break;
        }
    }
  }

  Future<bool> onWillPop() {
    currentIndex.value = 0;
    return Future.value(true);
  }
}
