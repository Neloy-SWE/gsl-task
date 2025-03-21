/*
* Created by Neloy on 20 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsl_task/utilities/app_color.dart';
import 'package:gsl_task/utilities/app_font.dart';

class AppTheme {
  static final get = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        fontFamily: AppFont.font500,
        color: AppColor.colorTextTitle,
        fontSize: 22,
      ),
    ),
    iconTheme: IconThemeData(color: AppColor.colorTextTitle),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: AppFont.font500,
        fontSize: 22,
        color: AppColor.colorTextTitle,
      ),
      titleMedium: TextStyle(
        fontFamily: AppFont.font600,
        fontSize: 16,
        color: AppColor.colorTextTitle,
      ),
      bodyLarge: TextStyle(
        fontFamily: AppFont.font500,
        fontSize: 14,
        color: AppColor.colorTextNormal,
      ),
      bodyMedium: TextStyle(
        fontFamily: AppFont.font600,
        fontSize: 12,
        color: AppColor.colorTextNormal,
      ),
    ),

    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: AppColor.colorBottomNavBarItemBackground,
      backgroundColor: Colors.white,
      elevation: 5,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            fontFamily: AppFont.font600,
            fontSize: 11,
            color: AppColor.colorTextTitle,
          );
        }
        return TextStyle(
          fontFamily: AppFont.font500,
          fontSize: 11,
          color: AppColor.colorTextTitle,
        );
      }),
    ),

    dropdownMenuTheme: DropdownMenuThemeData()
  );
}
