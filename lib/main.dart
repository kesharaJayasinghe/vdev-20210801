import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vdev20210801/constants/customTheme.dart';
import 'package:vdev20210801/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(VdevApp());
}

class VdevApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: CustomRouter.generateRoute,
      theme: CustomTheme.themeData,
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child,
        );
      },
    );
  }
}
