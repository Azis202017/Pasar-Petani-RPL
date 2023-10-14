import 'package:flutter/material.dart';

class CustomColors {
  CustomColors() {
    primaryMaterialColor = getMaterialColor(primaryColor);
    accentMaterialColor = getMaterialColor(accentColor);
  }

  // Change hex to Material Color
  MaterialColor getMaterialColor(Color color) {
    final Map<int, Color> shades = <int, Color>{
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1),
    };

    return MaterialColor(color.value, shades);
  }

  static const Color primaryColor = Color(0xff62C172);
  static const Color secondaryColor = Color(0xff041F08);
  static const Color normalTextColor = Color(0xff27303E);
  static const Color boldTextColor = Color(0xff3F4753);
  static const Color bottomNavbarColor = Color(0xffAAAAAA);
  static const Color primaryTextColor = Color(0xff17C118);
  static const Color accentColor = Color(0xffF4FBF4);
  MaterialColor primaryMaterialColor = Colors.green;
  MaterialColor accentMaterialColor = Colors.grey;
}
