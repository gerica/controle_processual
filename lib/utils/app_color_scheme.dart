import 'package:flutter/material.dart';
import 'package:controle_processual/utils/style_utils.dart';

class AppColorScheme {
  static final ColorScheme colorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    backgroundColor: LocalThemeColors.background,
    accentColor: LocalThemeColors.accentColor,
    primarySwatch: LocalThemeColors.primarySwatch,
    cardColor: LocalThemeColors.backgroundLight,
    errorColor: error,
  );

  static const white = Colors.white;

  static MaterialColor get primarySwatch => LocalThemeColors.primarySwatch;

  static MaterialColor get accentColor => LocalThemeColors.accentColor;

  static Color get background => LocalThemeColors.pinkLightest;

  static Color get whiteOutline => LocalThemeColors.whiteOutline;

  static Color get darkBlue => LocalThemeColors.darkBlue;

  static Color get pink => LocalThemeColors.pinkDark;

  static Color get footer => LocalThemeColors.footer;

  static Color get success => LocalThemeColors.success;

  static Color get error => LocalThemeColors.error;

  static Color get textPrimary => LocalThemeColors.textPrimary;

  static Color get textSecondary => LocalThemeColors.textSecondary;

  static Color get backgroundLight => LocalThemeColors.backgroundLight;

  static Color get backgroundPink => LocalThemeColors.backgroundPink;

  static Color get backgroundLightPink => LocalThemeColors.backgroundLightPink;

  static Color get backgroundExtraLightPink => LocalThemeColors.backgroundExtraLightPink;

  static Color get blueLight => LocalThemeColors.blueLight;

  static Color get gray1 => LocalThemeColors.gray1;

  static const lightGray = Color(0xffe4e4e4);

  static Color get yellow => LocalThemeColors.yellow;

  static Color get orange => LocalThemeColors.orange;

  static Color get pinkDark => LocalThemeColors.pinkDark;

  static Color get blue => LocalThemeColors.blue;
}

class LocalThemeColors {
  static final MaterialColor primarySwatch = StyleUtils.createMaterialColor(blue);
  static final MaterialColor accentColor = StyleUtils.createMaterialColor(darkBlue);

  static const whiteOutline = Color(0xFFFFFFFF);
  static const background = pinkLightest;
  static const darkBlue = Color(0xFF004764);
  static const blue = Color(0xFF71c0e1);
  static const blueLight = Color(0xFFA9E6FF);
  static const pinkDark = Color(0xFFC72E61);
  static const pink = Color(0xFFFA4B86);
  static const footer = Color(0xFFC72E61);
  static const textPrimary = Color(0xFF364E57);
  static const gray1 = Color(0xFFA8A8A8);
  static const textSecondary = Color(0xFF7698A4);
  static const backgroundLight = Color(0xFFF1F4F7);
  static const backgroundPink = Color(0xFFFC95B9);
  static const pinkLightest = Color(0xFFFFFAFC);
  static const backgroundLightPink = Color(0xFFFEE6EE);
  static const backgroundExtraLightPink = Color(0xFFFFF7F8);
  static const success = Color(0xFF00A624);
  static const error = Color(0xFFCF3E5A);
  static const yellow = Color(0xFFFED543);
  static const orange = Color(0xFFFD6C2E);
}
