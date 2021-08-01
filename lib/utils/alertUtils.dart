import 'package:flutter/material.dart';

import 'package:vdev20210801/components/progressDialog.dart';

class AlertUtils {
  static showProgressDialog(BuildContext context, String message) {
    try {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return WillPopScope(
                onWillPop: () async => false,
                child: ProgressDialog(context: context, message: message));
          });
    } catch (e) {
      // print('Error: $e');
    }
  }

  static closeProgressDialog(BuildContext context) {
    try {
      Navigator.of(context, rootNavigator: true).pop();
    } catch (e) {
      // print('Error: $e');
    }
  }
}