import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xffe65100),
      primaryContainer: Color(0xffffcc80),
      secondary: Color(0xff2979ff),
      secondaryContainer: Color(0xffe4eaff),
      tertiary: Color(0xff2962ff),
      tertiaryContainer: Color(0xffcbd6ff),
      appBarColor: Color(0xffe4eaff),
      error: Color(0xffb00020),
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.quicksand().fontFamily,
    scaffoldBackground: Color(0xFFF5F5F5),
    appBarBackground: Color(0xFFF5F5F5),
    background: Color(0xFFF5F5F5),
  );
  static ThemeData darkTheme = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xffff5722),
      primaryContainer: Color(0xffc87200),
      secondary: Color(0xff82b1ff),
      secondaryContainer: Color(0xff3770cf),
      tertiary: Color(0xff448aff),
      tertiaryContainer: Color(0xff0b429c),
      appBarColor: Color(0xff3770cf),
      error: Color(0xffcf6679),
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: GoogleFonts.quicksand().fontFamily,
    scaffoldBackground: Color(0xFF1E1E1E),
    appBarBackground: Color(0xFF1E1E1E),
    background: Color(0xFF1E1E1E),
  );
}
