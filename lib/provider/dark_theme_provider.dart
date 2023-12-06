import 'package:flutter/material.dart';

import '../services/dark_theme_prefs.dart';

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
