import 'package:flutter/material.dart';
import 'package:project1/themes/dark_mode.dart';
import 'package:project1/themes/light_mode.dart';

//เปลี่ยนธีม สลับไปมา


class ThemeChange with ChangeNotifier {
  //light mode
  ThemeData _themeData = lightMode;

  //get current theme
  ThemeData get themeData => _themeData;

  //check is it dark mode?
  bool get isDarkMode => _themeData == darkMode;

  //set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}