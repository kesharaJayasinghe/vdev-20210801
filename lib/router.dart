import 'package:flutter/material.dart';

import 'package:vdev20210801/screens/dashboard/dashboard.dart';
import 'package:vdev20210801/screens/errorScreen/errorScreen.dart';
import 'package:vdev20210801/screens/infoScreen/infoScreen.dart';
import 'package:vdev20210801/screens/signinScreen/signinScreen.dart';
import 'package:vdev20210801/screens/splashScreen/splashScreen.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case SigninScreen.route:
        return MaterialPageRoute(builder: (_) => SigninScreen());
      case Dashboard.route:
        return MaterialPageRoute(builder: (_) => Dashboard());
      case InfoScreen.route:
        return MaterialPageRoute(builder: (_) => InfoScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => ErrorScreen(routeName: settings.name),
        );
    }
  }
}
