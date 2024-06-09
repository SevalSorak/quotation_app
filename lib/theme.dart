import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Renk sabitleri
const kPrimaryColor = Color(0xFF7866FE);
const kSecondaryLightColor = Color(0xFFFFA41B);
const kSecondaryDarkColor = Color(0xFF121212);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kBackgroundColor = Color(0xFFF1EFF1);
const kErrorColor = Color(0xFFF03738);

const kPrimaryIconLightColor = Color(0xFF1D1D35);
const kAccentIconLightColor = Color(0xFFD1D1D1);
const kBodyTextColorLight = Color(0xFF1D1D35);
const kTitleTextLightColor = Color(0xFF1D1D35);

const kPrimaryIconDarkColor = Color(0xFFF5FCF9);
const kAccentIconDarkColor = Color(0xFF1D1D35);
const kBodyTextColorDark = Color(0xFFF5FCF9);
const kTitleTextDarkColor = Color(0xFFF5FCF9);

const kSurfaceDarkColor = Color(0xFF121212);
const kBackgroundDarkColor = Color(0xFF0D0C0E);

// AppBar tema ayarı
final appBarTheme = const AppBarTheme(color: Colors.transparent, elevation: 0);

// Light tema
ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    appBarTheme: appBarTheme,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      secondary: kSecondaryLightColor,
      background: Colors.white,
    ),
    iconTheme: const IconThemeData(color: kBodyTextColorLight),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: kAccentIconLightColor,
    ),
    primaryIconTheme: const IconThemeData(color: kPrimaryIconLightColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyText1: const TextStyle(color: kBodyTextColorLight),
      bodyText2: const TextStyle(color: kBodyTextColorLight),
      headline6: const TextStyle(color: kTitleTextLightColor, fontSize: 32),
      headline1: const TextStyle(color: kTitleTextLightColor, fontSize: 80),
    ),
  );
}

// Dark tema
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: const Color(0xFF0D0C0E),
    appBarTheme: appBarTheme,
    colorScheme: const ColorScheme.dark(
      secondary: kSecondaryDarkColor,
      surface: kSurfaceDarkColor,
      background: kBackgroundDarkColor,
    ),
    iconTheme: const IconThemeData(color: kBodyTextColorDark),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: kAccentIconDarkColor,
    ),
    primaryIconTheme: const IconThemeData(color: kPrimaryIconDarkColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyText1: const TextStyle(color: kBodyTextColorDark),
      bodyText2: const TextStyle(color: kBodyTextColorDark),
      headline6: const TextStyle(color: kTitleTextDarkColor, fontSize: 32),
      headline1: const TextStyle(color: kTitleTextDarkColor, fontSize: 80),
    ),
  );
}
