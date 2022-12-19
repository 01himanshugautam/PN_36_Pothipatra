import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pothipatra/common/onesignal_service.dart';
import 'package:pothipatra/providers/firebase_provider.dart';
import 'package:pothipatra/routes/theme_app_pages.dart';
import 'package:pothipatra/services/settings.dart';

import 'providers/node_provider.dart';
import 'services/auth_service.dart';
import 'services/global_service.dart';

void initServices() async {
  Get.log('starting services ...');

  Get.log('All services started...');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignalService().OneSignalSService();

  await Get.putAsync(() => FirebaseProvider().init());
  await GetStorage.init();
  await Get.putAsync(() => SettingsService().init());
  await Get.putAsync(() => GlobalService().init());
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => NodeApiClient().init());

  runApp(
    GetMaterialApp(
      title: "Pothipatra",
      initialRoute: ThemeAppPages.intital,
      getPages: ThemeAppPages.routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      themeMode: Get.find<SettingsService>().getThemeMode(),
      theme: Get.find<SettingsService>().getLightTheme(),
      darkTheme: Get.find<SettingsService>().getDarkTheme(),
    ),
  );
}
