import 'package:flutter/material.dart';
import 'package:news_task_app/configs/theme/app_colors.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';
import 'package:news_task_app/core/utils/fonts.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    fontFamily: 'Tajawal',
    primaryColor: AppColors.primaryColor,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: AppColors.grey,
      selectedItemColor: AppColors.white,
      backgroundColor: AppColors.primaryColor,
      type: BottomNavigationBarType.fixed,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      showSelectedLabels: true,

      selectedLabelStyle: tajawalMedium.copyWith(fontSize: 13.getFontSize(),overflow: TextOverflow.visible,),
      unselectedLabelStyle: tajawalMedium.copyWith(fontSize: 12.getFontSize(),overflow: TextOverflow.visible,)
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    scaffoldBackgroundColor: AppColors.white,
    toggleableActiveColor: AppColors.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.black, backgroundColor: AppColors.primaryColor,
      ),
    ),
  );
}