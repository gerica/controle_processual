import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:controle_processual/utils/app_color_scheme.dart';

class AppTextTheme {
  /// https://material.io/design/typography/the-type-system.html#type-scale - Helps to create textTheme

  static TextTheme get textTheme => textOpenSans;

  static TextTheme textOpenSans = TextTheme(
    headline1: GoogleFonts.openSans(fontSize: 96, fontWeight: FontWeight.w300, color: AppColorScheme.textPrimary),
    headline2: GoogleFonts.openSans(fontSize: 60, fontWeight: FontWeight.w300, color: AppColorScheme.textPrimary),
    headline3: GoogleFonts.openSans(fontSize: 48, fontWeight: FontWeight.w400, color: AppColorScheme.textPrimary),
    headline4: GoogleFonts.openSans(fontSize: 34, fontWeight: FontWeight.bold, color: AppColorScheme.textPrimary),
    headline5: GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.bold, color: AppColorScheme.textPrimary),
    headline6: GoogleFonts.openSans(fontSize: 17, fontWeight: FontWeight.bold, color: AppColorScheme.textPrimary),
    subtitle1: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w400, color: AppColorScheme.textPrimary),
    subtitle2: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w500, color: AppColorScheme.textPrimary),
    bodyText1: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600, color: AppColorScheme.textPrimary),
    bodyText2: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w400, color: AppColorScheme.textPrimary),
    button: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.bold, color: AppColorScheme.textPrimary),
    caption: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w400, color: AppColorScheme.textPrimary),
    overline: GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w400, color: AppColorScheme.textPrimary),
  );
}
