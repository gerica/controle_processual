import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_color_scheme.dart';
import 'app_font_size.dart';
import 'app_font_weight.dart';
import 'app_spacing.dart';
import 'app_text_theme.dart';

/// https://medium.com/flutter-community/page-transitions-using-themedata-in-flutter-c24afadb0b5d
class AppThemeData {
  AppThemeData._();

  static bool? _appThemeModeIsDark;

  static void setIfAppThemeModeIsDark({bool? isDark}) {
    _appThemeModeIsDark = isDark;
  }

  static bool get appThemeModeIsDark => _appThemeModeIsDark ?? false;

  static ThemeData get themeData => appThemeModeIsDark ? themeDataDark : themeDataLight;

  static ThemeMode get themeMode => ThemeMode.light;

  static final ThemeData themeDataLight = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: AppColorScheme.primarySwatch,
    textTheme: AppTextTheme.textTheme,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
    tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          fontWeight: AppFontWeight.semiBold,
          color: Colors.black,
          fontFamily: 'Montserrat'),
      unselectedLabelStyle: TextStyle(
          fontSize: AppFontSize.primary,
          color: Colors.black12,
          fontWeight: AppFontWeight.semiBold,
          fontFamily: 'Montserrat'),
      labelPadding: EdgeInsets.symmetric(horizontal: AppSpacing.extraSmall),
    ),
    scaffoldBackgroundColor: LocalThemeColors.background,
    colorScheme: AppColorScheme.colorScheme,
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: LocalThemeColors.background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: AppColorScheme.textPrimary)),
    highlightColor: Colors.transparent,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColorScheme.success,
      cursorColor: AppColorScheme.success,
      selectionHandleColor: AppColorScheme.success,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    iconTheme: IconThemeData(
      color: AppColorScheme.primarySwatch[500],
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(colorScheme: AppColorScheme.colorScheme, textTheme: ButtonTextTheme.primary),
  );

  static final ThemeData themeDataDark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: AppColorScheme.primarySwatch,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    tabBarTheme: const TabBarTheme(
      labelStyle:
          TextStyle(fontSize: AppFontSize.primary, fontWeight: AppFontWeight.semiBold, fontFamily: 'Montserrat'),
      unselectedLabelStyle:
          TextStyle(fontSize: AppFontSize.primary, fontWeight: AppFontWeight.semiBold, fontFamily: 'Montserrat'),
      labelPadding: EdgeInsets.symmetric(horizontal: AppSpacing.extraSmall),
    ),
    textTheme: AppTextTheme.textTheme,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: LocalThemeColors.background,
    colorScheme: AppColorScheme.colorScheme,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColorScheme.success,
      cursorColor: AppColorScheme.success,
      selectionHandleColor: AppColorScheme.success,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: LocalThemeColors.background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: AppColorScheme.textPrimary)),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    iconTheme: IconThemeData(
      color: AppColorScheme.primarySwatch[500],
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: LocalThemeColors.backgroundLight,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: LocalThemeColors.darkBlue,
      unselectedItemColor: LocalThemeColors.darkBlue.withOpacity(0.3),
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(colorScheme: AppColorScheme.colorScheme, textTheme: ButtonTextTheme.primary),
  );
}
