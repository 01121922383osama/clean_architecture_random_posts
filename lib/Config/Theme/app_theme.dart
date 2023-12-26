import 'package:clean_architecture/Core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../Core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        height: 1.3,
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    hintColor: AppColors.hint,
    fontFamily: AppStrings.fontFamily,
    brightness: Brightness.light,
  );
}
