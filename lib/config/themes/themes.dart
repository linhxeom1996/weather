import 'package:flutter/material.dart';
import '../../utils/constains/export.dart';


enum AppTheme { pinkLight, greyDark }

final themeData = {
  AppTheme.pinkLight: ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: ColorApp.white,
      brightness: Brightness.light
    ),
    highlightColor: ColorApp.transparent,
    textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: Dimens.sp22,
            color: ColorApp.black,
            fontWeight: FontWeight.w700),
        titleMedium: TextStyle(
            fontSize: Dimens.sp18,
            fontWeight: FontWeight.w600,
            color: ColorApp.black),
        headlineMedium: TextStyle(
            fontSize: Dimens.sp16,
            fontWeight: FontWeight.w700,
            color: ColorApp.black),
        bodyMedium: TextStyle(
            color: ColorApp.black,
            fontSize: Dimens.sp12,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            color: ColorApp.black,
            fontSize: Dimens.sp9,
            fontWeight: FontWeight.w400)),
  ),
  AppTheme.greyDark: ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      backgroundColor: ColorApp.black,
    ),
    highlightColor: ColorApp.transparent,
    textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: Dimens.sp22,
            color: ColorApp.white,
            fontWeight: FontWeight.w700),
        titleMedium: TextStyle(
            fontSize: Dimens.sp18,
            fontWeight: FontWeight.w600,
            color: ColorApp.white),
        headlineMedium: TextStyle(
            fontSize: Dimens.sp16,
            fontWeight: FontWeight.w700,
            color: ColorApp.white),
        bodyMedium: TextStyle(
            color: ColorApp.white,
            fontSize: Dimens.sp12,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            color: ColorApp.white,
            fontSize: Dimens.sp9,
            fontWeight: FontWeight.w400)),
  ),
};

extension CustomColorScheme on ColorScheme {
  Color get backgroundTab =>
      brightness == Brightness.light ? ColorApp.white : ColorApp.color333;
  Color get highLightTab =>
      brightness == Brightness.light ? ColorApp.colorD3A : ColorApp.colorBF2;
  Color get unHighLightTab =>
      brightness == Brightness.light ? ColorApp.colorD2D : ColorApp.colorDAD;
  Color get settingHeader =>
      brightness == Brightness.light ? Colors.white : ColorApp.black;
}

extension CustomAssetScheme on ColorScheme {
  String get settingHeaderIcon => brightness == Brightness.light
      ? IconApp.ic_loading_op1
      : IconApp.ic_loading_op2;
}
