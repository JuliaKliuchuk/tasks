import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasks/config.dart';

class MyTheme extends ChangeNotifier {
  static bool _isDark = false;
  MyTheme() {
    if (box!.containsKey('currentTheme')) {
      _isDark = box!.get('currentTheme');
    } else {
      box!.put('currentTheme', _isDark);
    }
  }

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void swichTheme() {
    _isDark = !_isDark;
    log('_isDark --- $_isDark');
    box!.put('currentTheme', _isDark);
    notifyListeners();
  }
}
