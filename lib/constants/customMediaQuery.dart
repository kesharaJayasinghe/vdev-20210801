import 'package:flutter/material.dart';

class CustomMediaQuery {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double topPadding(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static double bottomPadding(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  static bool isKeyboardOpen(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom != 0.0;
}
