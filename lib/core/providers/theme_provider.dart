import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData appTheme;

  ThemeProvider() {
    this.appTheme = this.lightTheme;
  }

  final ThemeData lightTheme = ThemeData(
    accentColor: Color(0xFF03A69A),
    brightness: Brightness.dark,
  );

  setAppTheme(ThemeData theme) {
    this.appTheme = theme;
    notifyListeners();
  }
}
