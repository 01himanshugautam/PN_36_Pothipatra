import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pothipatra/common/color_utils.dart';

class SettingsService extends GetxService {
  Future<SettingsService> init() async {
    return this;
  }

  SettingsService() {}

  ThemeData getLightTheme() {
    return ThemeData(
        primaryColor: const Color.fromRGBO(255, 255, 255, 1),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 0, foregroundColor: Colors.white),
        brightness: Brightness.light,
        dividerColor: ColorUtilities.colorPrimary,
        focusColor: ColorUtilities.colorPrimary,
        hintColor: ColorUtilities.dividercolor,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: ColorUtilities.dividercolor),
        ),
        colorScheme: ColorScheme.light(
          primary: ColorUtilities.colorPrimary,
          secondary: ColorUtilities.colorPrimary,
        ),
        appBarTheme: const AppBarTheme(color: Colors.white),
        textTheme: GoogleFonts.getTextTheme(
          "Poppins",
          TextTheme(
            headline6: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: ColorUtilities.colorPrimary,
                height: 1.3),
            headline5: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: ColorUtilities.colorBlack,
                height: 1.3),
            headline4: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: ColorUtilities.colorBlack,
                height: 1.3),
            headline3: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: ColorUtilities.colorBlack,
                height: 1.3),
            headline2: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                color: ColorUtilities.colorBlack,
                height: 1.4),
            headline1: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                color: ColorUtilities.colorBlack,
                height: 1.4),
            subtitle2: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: ColorUtilities.colorBlack,
                height: 1.2),
            subtitle1: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: ColorUtilities.colorBlack,
                height: 1.2),
            bodyText2: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                color: ColorUtilities.colorBlack,
                height: 1.2),
            bodyText1: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: ColorUtilities.colorBlack,
                height: 1.2),
            caption: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
                color: ColorUtilities.colorBlack,
                height: 1.2),
          ),
        ));
  }

  ThemeData getDarkTheme() {
    return ThemeData(
        primaryColor: const Color(0xFF242731),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(elevation: 0),
        scaffoldBackgroundColor: ColorUtilities.colorBlack,
        brightness: Brightness.dark,
        dividerColor: ColorUtilities.dividercolor,
        focusColor: ColorUtilities.colorPrimary,
        hintColor: ColorUtilities.kdarkGreyColor,
        toggleableActiveColor: ColorUtilities.colorPrimary,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: ColorUtilities.colorPrimary),
        ),
        appBarTheme: AppBarTheme(color: ColorUtilities.colorBlack),
        colorScheme: ColorScheme.dark(
          primary: ColorUtilities.colorPrimary,
          secondary: ColorUtilities.colorPrimary,
        ),
        textTheme: GoogleFonts.getTextTheme(
            'Poppins',
            TextTheme(
              headline6: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  color: ColorUtilities.colorWhite,
                  height: 1.3),
              headline5: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: ColorUtilities.colorWhite,
                  height: 1.3),
              headline4: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: ColorUtilities.colorWhite,
                  height: 1.3),
              headline3: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: ColorUtilities.colorWhite,
                  height: 1.3),
              headline2: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: ColorUtilities.colorWhite,
                  height: 1.4),
              headline1: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w300,
                  color: ColorUtilities.colorWhite,
                  height: 1.4),
              subtitle2: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: ColorUtilities.colorWhite,
                  height: 1.2),
              subtitle1: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: ColorUtilities.colorWhite,
                  height: 1.2),
              bodyText2: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                  color: ColorUtilities.colorWhite,
                  height: 1.2),
              bodyText1: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: ColorUtilities.colorWhite,
                  height: 1.2),
              caption: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  color: ColorUtilities.colorBlack,
                  height: 1.2),
            )));
  }

  ThemeMode getThemeMode() {
    String? _themeMode = GetStorage().read<String>('theme_mode');
    switch (_themeMode) {
      case 'ThemeMode.light':
        // SystemChrome.setSystemUIOverlayStyle(
        //   SystemUiOverlayStyle.light.copyWith(
        //       systemNavigationBarColor: Colors.black,
        //       statusBarColor: Colors.black),
        // );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        // SystemChrome.setSystemUIOverlayStyle(
        //   SystemUiOverlayStyle.dark.copyWith(
        //       systemNavigationBarColor: Colors.black,
        //       statusBarColor: Colors.black),
        // );
        return ThemeMode.dark;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        // SystemChrome.setSystemUIOverlayStyle(
        //   SystemUiOverlayStyle.light.copyWith(
        //       systemNavigationBarColor: Colors.black,
        //       statusBarColor: Colors.black),
        // );
        return ThemeMode.light;
    }
  }
}
