// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  get themeMode => _themeMode;

  bool _isDark = false;
  get isDark => _isDark;

  void toogleThemeMode() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
      _isDark = true;
    } else {
      _themeMode = ThemeMode.light;
      _isDark = false;
    }
    // print(themeMode);

    notifyListeners();
  }

  // void increment() {
  //   _count++;
  //   print(_count);
  //   notifyListeners();
  // }
}
