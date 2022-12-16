import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../common/asset_utils.dart';
import '../../../common/color_utils.dart';
import '../../../services/auth_service.dart';
import '../controllers/root_controller.dart';

GlobalKey globalKey = GlobalKey<NavigatorState>();

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    context.theme;
    Get.put<AuthService>(AuthService());

    return Obx(() {
      return Scaffold(
          body: IndexedStack(
              index: controller.currentIndex.value, children: controller.pages),
          resizeToAvoidBottomInset: false,
          bottomNavigationBar:
              /*  controller.currentIndex.toInt() == 1?
          null:*/
              BottomNavigationBar(
            key: globalKey,
            currentIndex: controller.currentIndex.toInt(),
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: ColorUtilities.colorPrimaryLight,
            onTap: (int index) {
              controller.changePage(index);
            },
            items: [
              BottomNavigationBarItem(
                  label: "Home",
                  icon: SvgPicture.asset(
                    AssetUtilities.home,
                    height: 20,
                    width: 20,
                    color: controller.currentIndex.toInt() == 0
                        ? ColorUtilities.colorPrimary
                        : ColorUtilities.colorPrimaryLight,
                  )),
              BottomNavigationBarItem(
                  label: "News",
                  icon: SvgPicture.asset(
                    AssetUtilities.news,
                    height: 20,
                    width: 20,
                    color: controller.currentIndex.toInt() == 1
                        ? ColorUtilities.colorPrimary
                        : ColorUtilities.colorPrimaryLight,
                  )),
              BottomNavigationBarItem(
                  label: "Bookmark",
                  icon: SvgPicture.asset(
                    AssetUtilities.bookmark,
                    height: 20,
                    width: 20,
                    color: controller.currentIndex.toInt() == 2
                        ? ColorUtilities.colorPrimary
                        : ColorUtilities.colorPrimaryLight,
                  )),
              BottomNavigationBarItem(
                  label: "Profile",
                  icon: SvgPicture.asset(
                    AssetUtilities.profile,
                    height: 20,
                    width: 20,
                    color: controller.currentIndex.toInt() == 3
                        ? ColorUtilities.colorPrimary
                        : ColorUtilities.colorPrimaryLight,
                  )),
            ],
          ));
    });
  }
}
