import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pothipatra/common/no_internet_screen.dart';
import 'package:pothipatra/modules/home/widget/filter_bottom-sheet.dart';
import 'package:pothipatra/routes/theme_app_pages.dart';

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
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                Get.isDarkMode ? AssetUtilities.logoWhite : AssetUtilities.logo,
                width: 100,
              ),
              // wSizedBox2,
              // Text(
              //   Get.find<InternetConnectionService>().result.toString(),
              //   style: FontStyleUtilities.f18(
              //     fontColor: Get.isDarkMode
              //         ? ColorUtilities.colorWhite
              //         : ColorUtilities.colorBlack,
              //     fontWeight: FWT.semiBold,
              //   ),
              // )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.search);
                },
                icon: Icon(
                  Icons.search,
                  color: ColorUtilities.colorPrimary,
                )),
            IconButton(
              onPressed: () {
                showMaterialModalBottomSheet(
                    context: context,
                    enableDrag: true,
                    isDismissible: true,
                    //barrierColor: ColorUtilities.colorPrimary.withOpacity(0.1),
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext bc) {
                      return const MenuBottomItemWidget();
                    });
              },
              icon: Icon(
                Icons.filter_list,
                color: ColorUtilities.colorPrimary,
                size: 21,
              ),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: Connectivity().onConnectivityChanged.asBroadcastStream(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            log("Connectivity ${snapshot.data}");
            return snapshot.data == ConnectivityResult.mobile ||
                    snapshot.data == ConnectivityResult.wifi ||
                    snapshot.data == null
                ? IndexedStack(
                    index: controller.currentIndex.value,
                    children: controller.pages,
                  )
                : const NoInternetScreen();
          },
        ),
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
        ),
      );
    });
  }
}
