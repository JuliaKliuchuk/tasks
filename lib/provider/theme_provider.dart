import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final String key = "theme";
  late SharedPreferences prefs;
  late bool darkTheme;

  ThemeProvider() {
    darkTheme = true;
    loadFromPrefs();
  }

  loadFromPrefs() async {
    await _initPrefs();
    darkTheme = prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  toggleTheme() {
    darkTheme = !darkTheme;
    saveToPrefs();
    notifyListeners();
  }

  saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, darkTheme);
  }
}
