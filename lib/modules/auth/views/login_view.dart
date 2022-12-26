import 'package:get/get.dart';
import 'package:pothipatra/common/asset_utils.dart';
import 'package:pothipatra/common/color_utils.dart';
import 'package:pothipatra/modules/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:pothipatra/modules/global_widgets/font_style_util.dart';
import 'package:pothipatra/modules/global_widgets/sizes_box.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    context.theme;
    controller.loginFormKey = GlobalKey<FormState>();
    return
        // WillPopScope(
        //     onWillPop: Helper().onWillPop,
        //     child:
        Scaffold(
      body: Form(
        key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                hSizedBox5,
                Text(
                  "Welcome to Pothipatra",
                  style: FontStyleUtilities.f24(
                      fontColor: ColorUtilities.colorBlack,
                      fontWeight: FWT.semiBold),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Get.isDarkMode
                            ? AssetUtilities.logoWhite
                            : AssetUtilities.logo,
                        width: 200,
                        height: 200,
                      ),

                      /* hSizedBox2,
                          TextFieldWidget(
                            hintText: "Enter here",
                            keyboardType: TextInputType.phone,
                            onSaved: (input) => {},
                            //errorText: "Please enter phone number",

                            labelText: "Email*",
                            style: FontStyleUtilities.f14(
                                fontColor: ColorUtilities.colorPrimary,
                                fontWeight: FWT.medium),
                            onChanged: (value) => {},
                            validator: (input) => input != null && input.isEmpty
                                ? "Please enter a email address"
                                : "",
                          ),
                          hSizedBox2,
                          TextFieldWidget(
                            hintText: "Enter here",

                            keyboardType: TextInputType.text,
                            obscureText: true,
                            onSaved: (input) => {},
                            //errorText: "Please enter phone number",
                            labelText: "Password*",
                            style: FontStyleUtilities.f14(
                                fontColor: ColorUtilities.colorPrimary,
                                fontWeight: FWT.medium),
                            onChanged: (value) => {},
                            validator: (input) => input != null && input.isEmpty
                                ? "Please enter a Password"
                                : "",
                            suffix: controller.hidePassword.isTrue,
                            suffixIcon: Icon(
                              Icons.remove_red_eye,
                              color: Get.theme.primaryColor,
                            ),
                          ),
                          hSizedBox2,
                          Obx(() {
                            if (controller.loading.isTrue) {
                              return const CircularLoadingWidget();
                            } else {
                              return RoundedButton(
                                vertical: 0,
                                color: ColorUtilities.colorPrimary,
                                press: () {
                                  Get.offAndToNamed(Routes.root);
                                },
                                text: "Sign in",
                              );
                            }
                          }),
                          TextButton(
                              onPressed: () {},
                              child: Text("Forgot the password?",
                                  style: FontStyleUtilities.f14(
                                      fontColor: ColorUtilities.colorPrimary,
                                      fontWeight: FWT.medium))),
                          hSizedBox1,
                          Text("or continue with",
                              style: FontStyleUtilities.f14(
                                  fontColor: Get.isDarkMode
                                      ? ColorUtilities.colorWhite
                                      : ColorUtilities.colorBlack,
                                  fontWeight: FWT.medium)),*/
                    ],
                  ),
                ),
                Obx(() {
                  return controller.loading.isTrue
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.signInWithFacebook();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.grey.shade300)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AssetUtilities.facebook,
                                        width: 32,
                                      ),
                                      wSizedBox1,
                                      Text(
                                        "Facebook",
                                        style: FontStyleUtilities.f14(
                                          fontColor: Get.isDarkMode
                                              ? ColorUtilities.colorWhite
                                              : ColorUtilities.colorBlack,
                                          fontWeight: FWT.medium,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            hSizedBox2,
                            InkWell(
                              onTap: () {
                                controller.signInWithGoogle();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.grey.shade400)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AssetUtilities.google,
                                        width: 32,
                                      ),
                                      wSizedBox1,
                                      Text(
                                        "Google",
                                        style: FontStyleUtilities.f14(
                                          fontColor: Get.isDarkMode
                                              ? ColorUtilities.colorWhite
                                              : ColorUtilities.colorBlack,
                                          fontWeight: FWT.medium,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                }),
                hSizedBox2,
              ],
            ),
          ),
        ),
      ),
    );
    // )
  }
}
