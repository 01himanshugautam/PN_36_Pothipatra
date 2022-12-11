import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pothipatra/routes/theme_app_pages.dart';
import 'package:pothipatra/services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String? route) {
    Get.put<AuthService>(AuthService());
    final authService = Get.find<AuthService>();
    if (!authService.isAuth) {
      return const RouteSettings(name: Routes.login);
    } else {
      return const RouteSettings(name: Routes.root);
    }
  }
}
