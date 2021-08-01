import 'package:flutter/material.dart';
import 'package:vdev20210801/screens/errorScreen/errorScreen.dart';
import 'package:vdev20210801/screens/splashScreen/splashScreen.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => ErrorScreen(routeName: settings.name),
        );
    }
  }
}
