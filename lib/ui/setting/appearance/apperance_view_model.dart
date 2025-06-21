import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lightweaver/core/others/base_view_model.dart';

class ApperanceViewModel extends BaseViewModel {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  ApperanceViewModel() {
    _loadThemeFromPrefs();
  }

  Future<void> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDarkTheme') ?? false;
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Future<void> setTheme(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', mode == ThemeMode.dark);
    notifyListeners();
  }

  /// Optional helpers for UI radio buttons or toggles
  bool get isLightSelected => _themeMode == ThemeMode.light;
  bool get isDarkSelected => _themeMode == ThemeMode.dark;
}
