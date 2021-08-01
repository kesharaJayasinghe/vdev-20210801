import 'package:flutter/material.dart';
import 'package:vdev20210801/constants/palette.dart';

class SplashScreen extends StatelessWidget {
  static const String route = '/';
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgGrey,
      body: Center(
        child: Text('VDEV-20210801'),
      ),
    );
  }
}
