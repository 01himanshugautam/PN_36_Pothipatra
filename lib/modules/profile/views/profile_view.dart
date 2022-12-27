import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:pothipatra/common/color_utils.dart';
import 'package:pothipatra/common/custom_button.dart';
import 'package:pothipatra/modules/global_widgets/font_style_util.dart';
import 'package:pothipatra/modules/global_widgets/sizes_box.dart';
import 'package:pothipatra/modules/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:pothipatra/routes/theme_app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/auth_service.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    context.theme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              hSizedBox2,
              Get.find<AuthService>().isAuth == true
                  ? Column(
                      children: [
                        if (Get.find<AuthService>().user.value.photoUrl != null)
                          Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    Get.find<AuthService>()
                                        .user
                                        .value
                                        .photoUrl
                                        .toString(),
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              )),
                        hSizedBox1,
                        Text(
                          Get.find<AuthService>().user.value.name.toString(),
                          style: FontStyleUtilities.f16(
                              fontColor: Get.isDarkMode
                                  ? ColorUtilities.colorWhite
                                  : ColorUtilities.colorBlack,
                              fontWeight: FWT.semiBold),
                        ),
                        Text(
                          Get.find<AuthService>().user.value.email.toString(),
                          style: FontStyleUtilities.f14(
                              fontColor: Get.isDarkMode
                                  ? ColorUtilities.colorWhite
                                  : ColorUtilities.colorBlack,
                              fontWeight: FWT.medium),
                        ),
                      ],
                    )
                  : CustomButton(
                      title: "Login",
                      height: 60,
                      isFlatButton: true,
                      buttonColor: Get.isDarkMode
                          ? ColorUtilities.colorWhite
                          : ColorUtilities.colorBlack,
                      textColor: !Get.isDarkMode
                          ? ColorUtilities.colorWhite
                          : ColorUtilities.colorBlack,
                      width: (screenSize.width / 2) - 50,
                      onButtonTap: () async {
                        Get.toNamed(Routes.login);
                      },
                    ),

              // hSizedBox1,
              // Text(
              //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
              //   textAlign: TextAlign.center,
              //   style: FontStyleUtilities.f11(
              //       fontColor: Colors.grey, fontWeight: FWT.regular),
              // ),
              hSizedBox2,
              ListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
                onTap: () {
                  Get.toNamed(Routes.theme);
                },
                leading: const Icon(Icons.dark_mode),
                title: const Text("Theme"),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
                onTap: () async {
                  await FlutterShare.share(
                    title: 'Pothipatra',
                    text:
                        'Download Pothipatra App on Google Play here- "\n"+"https://play.google.com/store/apps/details?id=com.app.pothipatra"}',
                  );
                },
                leading: const Icon(Icons.share),
                title: const Text("Share App"),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://play.google.com/store/apps/details?id=com.app.pothipatra'));
                },
                leading: const Icon(Icons.star_rate),
                title: const Text("Rate this App"),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
                onTap: () {
                  controller.getPages("6296");
                  Get.toNamed(Routes.about);
                },
                leading: const Icon(Icons.info_outline),
                title: const Text("About us"),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
                onTap: () {
                  controller.getPages("6293");
                  Get.toNamed(Routes.terms);
                },
                leading: const Icon(Icons.file_copy_outlined),
                title: const Text("Terms and Condition"),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
                onTap: () {
                  controller.getPages("3");
                  Get.toNamed(Routes.privacy);
                },
                leading: const Icon(Icons.privacy_tip),
                title: const Text("Privacy Policy"),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),

              !Get.find<AuthService>().isAuth
                  ? const SizedBox()
                  : ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -3),
                      onTap: () {
                        controller.logout();
                      },
                      leading: const Icon(Icons.logout),
                      title: const Text(
                        "Logout",
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
