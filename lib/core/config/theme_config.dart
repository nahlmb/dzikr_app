import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  static var lightTheme = ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      brightness: Brightness.light,
      colorScheme: ThemeConfig.lightColorScheme,
      scaffoldBackgroundColor: ThemeConfig.lightColorScheme.background,
      iconTheme:
          IconThemeData(color: ThemeConfig.lightColorScheme.onBackground),
      textTheme: ThemeConfig.textTheme.apply(
          bodyColor: ThemeConfig.lightColorScheme.onBackground,
          displayColor: ThemeConfig.lightColorScheme.onBackground),
      appBarTheme: AppBarTheme(
          titleTextStyle: ThemeConfig.textTheme.headline1
              ?.copyWith(color: ThemeConfig.lightColorScheme.onBackground),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: ThemeConfig.lightColorScheme.background));

  static var darkTheme = ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      colorScheme: ThemeConfig.darkColorScheme,
      scaffoldBackgroundColor: ThemeConfig.darkColorScheme.background,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: ThemeConfig.darkColorScheme.onBackground),
      textTheme: ThemeConfig.textTheme.apply(
          bodyColor: ThemeConfig.darkColorScheme.onBackground,
          displayColor: ThemeConfig.darkColorScheme.onBackground),
      appBarTheme: AppBarTheme(
          titleTextStyle: ThemeConfig.textTheme.headline1
              ?.copyWith(color: ThemeConfig.darkColorScheme.onBackground),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: ThemeConfig.darkColorScheme.background));

  static var lightColorScheme = ColorScheme.light(
    brightness: Brightness.light,
    primary: const Color(0xff0FA971),
    onPrimary: const Color(0xFFFFFFFF),
    primaryContainer: const Color(0xFF72FDA8),
    onPrimaryContainer: const Color(0xFF00210D),
    secondary: const Color(0xFF006C46),
    onSecondary: const Color(0xFFFFFFFF),
    secondaryContainer: const Color(0xFF8DF8C2),
    onSecondaryContainer: const Color(0xFF002112),
    tertiary: const Color(0xFF006D41),
    onTertiary: const Color(0xFFFFFFFF),
    tertiaryContainer: const Color(0xFF92F7BC),
    onTertiaryContainer: const Color(0xFF002110),
    error: const Color(0xFFB3261E),
    errorContainer: const Color(0xFFF9DEDC),
    onError: const Color(0xFFFFFFFF),
    onErrorContainer: const Color(0xFF410E0B),
    background: const Color(0xFFFFFFFF),
    onBackground: const Color(0xFF191C1D),
    surface: Colors.black.withOpacity(0.07),
    onSurface: const Color(0xFF191C1D),
    surfaceVariant: const Color(0xFFE7E0EC),
    onSurfaceVariant: const Color(0xFF49454F),
    outline: const Color(0xFF79747E),
    onInverseSurface: const Color(0xFFEFF1F1),
    inverseSurface: const Color(0xFF2D3132),
    inversePrimary: const Color(0xFF51DF8D),
    shadow: const Color(0xFF000000),
  );

  static var darkColorScheme = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: const Color(0xFF51DF8D),
    onPrimary: const Color(0xFF00391B),
    primaryContainer: const Color(0xFF00522A),
    onPrimaryContainer: const Color(0xFF72FDA8),
    secondary: const Color(0xFF71DBA7),
    onSecondary: const Color(0xFF003822),
    secondaryContainer: const Color(0xFF005234),
    onSecondaryContainer: const Color(0xFF8DF8C2),
    tertiary: const Color(0xFF76DAA1),
    onTertiary: const Color(0xFF00391F),
    tertiaryContainer: const Color(0xFF00522F),
    onTertiaryContainer: const Color(0xFF92F7BC),
    error: const Color(0xFFF2B8B5),
    errorContainer: const Color(0xFF8C1D18),
    onError: const Color(0xFF601410),
    onErrorContainer: const Color(0xFFF9DEDC),
    background: const Color(0xFF191C1D),
    onBackground: const Color(0xFFE0E3E3),
    surface: Colors.white.withOpacity(0.07),
    onSurface: const Color(0xFFE0E3E3),
    surfaceVariant: const Color(0xFF49454F),
    onSurfaceVariant: const Color(0xFFCAC4D0),
    outline: const Color(0xFF938F99),
    onInverseSurface: const Color(0xFF191C1D),
    inverseSurface: const Color(0xFFE0E3E3),
    inversePrimary: const Color(0xFF006D3A),
    shadow: const Color(0xFF000000),
  );

  static var textTheme = GoogleFonts.workSansTextTheme().copyWith(
    headline1: GoogleFonts.notoSerif()
        .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
    headline2: GoogleFonts.notoSerif()
        .copyWith(fontWeight: FontWeight.bold, fontSize: 22),
    headline3: GoogleFonts.notoSerif()
        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
    headline4: GoogleFonts.notoSerif()
        .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
    headline5: GoogleFonts.notoSerif()
        .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
    headline6: GoogleFonts.notoSerif()
        .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
    bodyText2: GoogleFonts.workSans().copyWith(fontSize: 14),
    bodyText1: GoogleFonts.workSans().copyWith(fontSize: 14),
  );

  static Color sweetGreen = const Color(0xff0FA971);
  static Color sweetOrange = const Color(0xffECA61E);
  static Color sweetPurple = const Color(0xff4355F1);
  static Color sweetRed = const Color(0xffD42479);
}

const double padding3XS = 1;
const double padding2XS = 2;
const double paddingXS = 4;
const double paddingS = 6;
const double paddingM = 8;
const double paddingL = 12;
const double padding2L = 16;
const double paddingXL = 18;
const double padding2XL = 24;
const double padding3XL = 28;
const double padding4XL = 32;
const double padding5XL = 36;
const double padding6XL = 64;
const double padding7XL = 72;
const double padding8XL = 92;
