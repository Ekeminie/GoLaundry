import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF859812);
Color primaryDarkColor = const Color(0xFF064453);
Color primaryLight = const Color(0xFF98AD17);
Color light = const Color(0xFFCDE151);

Color grey = const Color(0xFFCAD4DD);
Color lightBgColor = const Color(0xFFF5F7E8);
Color textDark = const Color(0xFF0D141E);
Color greyBg = const Color(0xFFF7FAFA);
Color textLight = const Color(0xFF8D94A2);
Color inputFocus = const Color(0xFFF7FAFA);
Color drawerColor = const Color(0xFF005262);

Color border = const Color(0xFFE9EBF0);
Color customTextColor = const Color(0xFF150439);
Color redColor = const Color(0xFFD0021B);
Color white = const Color(0xFFFFFFFF);
Color authBtnColor = const Color(0xFFFAFBFC);

const MaterialColor primarypalette =
    MaterialColor(_primarypalettePrimaryValue, <int, Color>{
  50: Color(0xFFF0F3E3),
  100: Color(0xFFDAE0B8),
  200: Color(0xFFC2CC89),
  300: Color(0xFFAAB759),
  400: Color(0xFF97A736),
  500: Color(_primarypalettePrimaryValue),
  600: Color(0xFF7D9010),
  700: Color(0xFF72850D),
  800: Color(0xFF687B0A),
  900: Color(0xFF556A05),
});
const int _primarypalettePrimaryValue = 0xFF859812;

const MaterialColor primarypaletteAccent =
    MaterialColor(_primarypaletteAccentValue, <int, Color>{
  100: Color(0xFFE7FF9A),
  200: Color(_primarypaletteAccentValue),
  400: Color(0xFFCFFF34),
  700: Color(0xFFC9FF1A),
});
const int _primarypaletteAccentValue = 0xFFDBFF67;
