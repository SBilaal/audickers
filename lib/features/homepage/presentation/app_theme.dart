import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  static Color _color = Color(0xFF7E43DB);
  static bool get isDark => _isDark;
  static bool _isDark;

  static ThemeData _lightTheme = ThemeData.light().copyWith(
    primaryColor: _color,
  );
  static ThemeData _darkTheme = ThemeData.dark().copyWith(
    primaryColor: _color,
  );
  static ThemeData appTheme = _lightTheme;

  void changeAppTheme(bool isDarkened) {
    _isDark = isDarkened;
    _isDark ? appTheme = _darkTheme : appTheme = _lightTheme;
    notifyListeners();
  }
}



class LightTheme {
  static Color grey = Color(0xFFF6F6F4);
  static Color red = Color(0xFFEB5757);
  static Color black = Color(0xFF121212);
  static Color lightRed = Color(0xFFFDEFEF);
  static Color lightGrey = Color(0xFFA1A1A1);
  static Color hintColor = Color(0xFFA2A2A2);
}

class DarkTheme {
  static Color grey = Color(0xFF2B2B2B);
  static Color red = Color(0xFFF6B2B2);
  static Color lightRed = Color(0xFF3F2121);
  static Color hintColor = Colors.white.withOpacity(0.5);
  static Color purpleBackground = Color(0xFF291D3C);
  static Color purpleText = Color(0xFFD6C3F4);

}
