import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'palette.dart';

class CustomTheme {
  static ThemeData themeData = ThemeData(
      fontFamily: 'Poppins',
      primarySwatch: Palette.materialColor,
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: Palette.materialColor,
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: Palette.tomato),
      primaryColor: Palette.tomato);
}
