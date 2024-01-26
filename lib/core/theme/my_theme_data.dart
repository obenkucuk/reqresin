// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'my_colors.dart';

@immutable
final class MyThemeData {
  const MyThemeData({
    this.myColors = const MyColors(
      primaryColor: CupertinoColors.activeBlue,
    ),
  });

  final MyColors myColors;

  ThemeData get light {
    // final canvasColor = MyColors.light.canvasColor;
    final scaffoldBackgroundColor = MyColors.light.scaffoldBackgroundColor;
    final textColor = MyColors.dark.scaffoldBackgroundColor;
    final cupertinoTextStyle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: textColor,
    );

    return ThemeData(
      typography: Typography.material2021(),
      colorScheme: ColorScheme.fromSeed(seedColor: myColors.primaryColor),
      extensions: const <ThemeExtension<dynamic>>[MyColors.light],

      cupertinoOverrideTheme: CupertinoThemeData(
        primaryContrastingColor: Colors.black,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        barBackgroundColor: CupertinoColors.systemGrey6,
        applyThemeToAll: true,
        textTheme: CupertinoTextThemeData(
          primaryColor: myColors.primaryColor,
          textStyle: cupertinoTextStyle,
          actionTextStyle: cupertinoTextStyle,
          pickerTextStyle: cupertinoTextStyle,
          navTitleTextStyle: cupertinoTextStyle,
          navActionTextStyle: cupertinoTextStyle,
          navLargeTitleTextStyle: TextStyle(
            fontSize: 36.sp,
            fontWeight: FontWeight.w900,
            color: textColor,
          ),
        ),
      ),

      /// where "light" is FontWeight.w300, "regular" is FontWeight.w400 and "medium" is FontWeight.w500.
      textTheme: TextTheme(
        /// Label TextTheme
        labelSmall: TextStyle(
            fontSize: 11.sp, fontWeight: FontWeight.w500, color: textColor),
        labelMedium: TextStyle(
            fontSize: 12.sp, fontWeight: FontWeight.w500, color: textColor),
        labelLarge: TextStyle(
            fontSize: 14.sp, fontWeight: FontWeight.w500, color: textColor),

        /// Body TextTheme
        bodySmall: TextStyle(
            fontSize: 12.sp, fontWeight: FontWeight.w400, color: textColor),
        bodyMedium: TextStyle(
            fontSize: 14.sp, fontWeight: FontWeight.w400, color: textColor),
        bodyLarge: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w400, color: textColor),

        /// Title TextTheme
        titleSmall: TextStyle(
            fontSize: 14.sp, fontWeight: FontWeight.w500, color: textColor),
        titleMedium: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w500, color: textColor),
        titleLarge: TextStyle(
            fontSize: 22.sp, fontWeight: FontWeight.w500, color: textColor),

        /// Headline TextTheme
        headlineSmall: TextStyle(
            fontSize: 24.sp, fontWeight: FontWeight.w400, color: textColor),
        headlineMedium: TextStyle(
            fontSize: 28.sp, fontWeight: FontWeight.w400, color: textColor),
        headlineLarge: TextStyle(
            fontSize: 32.sp, fontWeight: FontWeight.w400, color: textColor),

        /// Display TextTheme
        displaySmall: TextStyle(
            fontSize: 36.sp, fontWeight: FontWeight.w400, color: textColor),
        displayMedium: TextStyle(
            fontSize: 45.sp, fontWeight: FontWeight.w400, color: textColor),
        displayLarge: TextStyle(
            fontSize: 57.sp, fontWeight: FontWeight.w400, color: textColor),
      ),
    );
  }

  ThemeData get dark {
    final scaffoldBackgroundColor = MyColors.dark.scaffoldBackgroundColor;

    final textColor = MyColors.light.scaffoldBackgroundColor;
    final cupertinoTextStyle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: textColor,
    );

    return ThemeData(
      primaryColor: myColors.primaryColor,
      extensions: const <ThemeExtension<dynamic>>[MyColors.dark],
      typography: Typography.material2021(),

      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: Brightness.dark,
        barBackgroundColor: scaffoldBackgroundColor,
        applyThemeToAll: true,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: CupertinoTextThemeData(
          primaryColor: myColors.primaryColor,
          textStyle: cupertinoTextStyle,
          actionTextStyle: cupertinoTextStyle,
          pickerTextStyle: cupertinoTextStyle,
          navTitleTextStyle: cupertinoTextStyle,
          navActionTextStyle: cupertinoTextStyle,
          navLargeTitleTextStyle: TextStyle(
            fontSize: 36.sp,
            fontWeight: FontWeight.w900,
            color: MyColors.light.scaffoldBackgroundColor,
          ),
        ),
      ),

      /// where "light" is FontWeight.w300, "regular" is FontWeight.w400 and "medium" is FontWeight.w500.
      textTheme: TextTheme(
        /// Label TextTheme
        labelSmall: TextStyle(
            fontSize: 11.sp, fontWeight: FontWeight.w500, color: textColor),
        labelMedium: TextStyle(
            fontSize: 12.sp, fontWeight: FontWeight.w500, color: textColor),
        labelLarge: TextStyle(
            fontSize: 14.sp, fontWeight: FontWeight.w500, color: textColor),

        /// Body TextTheme
        bodySmall: TextStyle(
            fontSize: 12.sp, fontWeight: FontWeight.w400, color: textColor),
        bodyMedium: TextStyle(
            fontSize: 14.sp, fontWeight: FontWeight.w400, color: textColor),
        bodyLarge: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w400, color: textColor),

        /// Title TextTheme
        titleSmall: TextStyle(
            fontSize: 14.sp, fontWeight: FontWeight.w500, color: textColor),
        titleMedium: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w500, color: textColor),
        titleLarge: TextStyle(
            fontSize: 22.sp, fontWeight: FontWeight.w500, color: textColor),

        /// Headline TextTheme
        headlineSmall: TextStyle(
            fontSize: 24.sp, fontWeight: FontWeight.w400, color: textColor),
        headlineMedium: TextStyle(
            fontSize: 28.sp, fontWeight: FontWeight.w400, color: textColor),
        headlineLarge: TextStyle(
            fontSize: 32.sp, fontWeight: FontWeight.w400, color: textColor),

        /// Display TextTheme
        displaySmall: TextStyle(
            fontSize: 36.sp, fontWeight: FontWeight.w400, color: textColor),
        displayMedium: TextStyle(
            fontSize: 45.sp, fontWeight: FontWeight.w400, color: textColor),
        displayLarge: TextStyle(
            fontSize: 57.sp, fontWeight: FontWeight.w400, color: textColor),
      ),
    );
  }
}
