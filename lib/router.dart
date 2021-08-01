import 'package:flutter/material.dart';
import 'package:vdev20210801/screens/errorScreen/errorScreen.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (_) => ErrorScreen(routeName: settings.name),
        );
    }
  }
}
