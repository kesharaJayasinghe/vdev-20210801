import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vdev20210801/components/customText.dart';
import 'package:vdev20210801/components/verticalSpacing.dart';
import 'package:vdev20210801/constants/customMediaQuery.dart';
import 'package:vdev20210801/constants/palette.dart';
import 'package:vdev20210801/screens/dashboard/providers/productProvider.dart';
import 'package:vdev20210801/screens/dashboard/widgets/categoryList.dart';
import 'package:vdev20210801/screens/signinScreen/providers/userProvider.dart';
import 'package:vdev20210801/utils/cacheData.dart';

class Dashboard extends StatefulWidget {
  static const String route = '/dashboard';

  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final double width = CustomMediaQuery.width(context);
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
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: width,
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    width: width * 0.6,
                    child: CustomText(
                      text: userProvider.userModel.email,
                      textSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  VerticalSpacing(width: 15),
                  ElevatedButton(
                    onPressed: () async {
                      await CacheData().deleteUserInfo();
                      userProvider.removeUser();
                      Navigator.pushReplacementNamed(context, '/signinScreen');
                    },
                    child: CustomText(
                      text: 'Sign-Out',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              padding: EdgeInsets.only(left: 12),
              child: CustomText(
                text: 'Product Categories',
                textAlign: TextAlign.start,
                textSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            CategoryList(),
          ],
        ),
      ),
    );
  }
}
