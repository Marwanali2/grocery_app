import 'package:flutter/material.dart';
import 'package:grocery_app/shared_pref/dark_theme_prefs.dart';

class DarkThemeProvider extends ChangeNotifier {
  bool _darkTheme = false;
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  bool get getDarkTheme => _darkTheme;

  set setDarkThemeProvider(bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkThemePrefs(value);
    notifyListeners();
  }
}
