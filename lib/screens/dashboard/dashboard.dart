import 'package:flutter/material.dart';
import 'package:vdev20210801/components/customText.dart';
import 'package:vdev20210801/constants/palette.dart';

class Dashboard extends StatefulWidget {
  static const String route = '/dashboard';

  const Dashboard({ Key key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgGrey,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Dashboard',
          textSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child:  Column(
          children: [
            Container(
              child: CustomText(text: 'Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}