import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

final ThemeData defaultTheme = ThemeData(
  primaryColor: CustomColors.primaryColor,
  primarySwatch: CustomColors().primaryMaterialColor,
  fontFamily: GoogleFonts.poppins().fontFamily,
  buttonTheme: const ButtonThemeData(
    buttonColor: CustomColors.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    height: 44,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: CustomColors.primaryColor,
    elevation: 0,
    toolbarHeight: 88,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      height: 1.2,
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: CustomColors.accentColor,
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: CustomColors.secondaryColor,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: CustomColors.bottomNavbarColor,
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: CustomColors.normalTextColor,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: CustomColors.normalTextColor,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: CustomColors.primaryTextColor,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Colors.black,
    ),
  ),
);
