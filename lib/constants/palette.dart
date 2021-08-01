import 'package:flutter/material.dart';

class Palette {
  static const Color black = Colors.black;
  static const Color white = Color(0xFFFFFFFF);
  static const Color tomato = Color(0xFFEF3434);
  static const Color bgGrey = Color(0xFFecf0f6);
  static const Color blueyGrey = Color(0xFFB2B2C3);
  static const Color silverBackground = Color.fromRGBO(218, 223, 238, 1);

  static MaterialColor materialColor = MaterialColor(
    0xFFEF3434,
    <int, Color>{
      50: Color(0xFFe63c2d),
      100: Color(0xFFe63c2d),
      200: Color(0xFFe63c2d),
      300: Color(0xFFe63c2d),
      400: Color(0xFFe63c2d),
      500: Color(0xFFe63c2d),
      600: Color(0xFFe63c2d),
      700: Color(0xFFe63c2d),
      800: Color(0xFFe63c2d),
      900: Color(0xFFe63c2d),
    },
  );
}
