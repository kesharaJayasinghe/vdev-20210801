import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vdev20210801/components/customText.dart';
import 'package:vdev20210801/constants/palette.dart';
import 'package:vdev20210801/screens/signinScreen/providers/userProvider.dart';
import 'package:vdev20210801/utils/cacheData.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/';
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String path = '/signinScreen';
  @override
  void initState() {
    super.initState();
    pathCheck();
  }

  pathCheck() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    CacheData().getUserInfo().then((value) {
      if (value == null) {
        path = '/signinScreen';
      } else {
        userProvider.addUser(value);
        path = '/dashboard';
      }
      Navigator.pushReplacementNamed(context, path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgGrey,
      body: Center(
        child: CustomText(text: 'VDEV-20210801'),
      ),
    );
  }
}
