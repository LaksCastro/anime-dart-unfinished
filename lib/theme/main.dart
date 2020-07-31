import 'package:flutter/material.dart';

class AppTheme {
  static final Color primaryColor = Color(0xff6237a0);
  static final Color accentColor = Color(0xff9754cb);
  static final Color secondaryHeaderColor = Color(0xffdeacf5);
  static final VisualDensity visualDensity =
      VisualDensity.adaptivePlatformDensity;

  static final ThemeData data = ThemeData(
      primaryColor: AppTheme.primaryColor,
      accentColor: AppTheme.accentColor,
      secondaryHeaderColor: AppTheme.secondaryHeaderColor,
      visualDensity: AppTheme.visualDensity,
      fontFamily: "Raleway");
}

class AppDarkTheme {
  static final ThemeData data =
      ThemeData(brightness: Brightness.dark, fontFamily: "Raleway");
}
