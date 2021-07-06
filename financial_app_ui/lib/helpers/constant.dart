import 'package:flutter/material.dart';

ThemeData appGlobalTheme = ThemeData(
  primarySwatch: Colors.blue,
  accentColor: Color(0xff0e316e),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: Color(0xff0e316e),
      size: 30,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
      size: 30,
    ),
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
);
