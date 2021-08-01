import 'package:flutter/material.dart';
import 'package:vdev20210801/components/customText.dart';
import 'package:vdev20210801/components/verticalSpacing.dart';
import 'package:vdev20210801/constants/customMediaQuery.dart';
import 'package:vdev20210801/constants/palette.dart';

class ProgressDialog extends Padding {
  final BuildContext context;
  final String message;

  ProgressDialog({this.context, this.message})
      : super(
          padding: EdgeInsets.only(
              left: CustomMediaQuery.width(context) * .05,
              right: CustomMediaQuery.width(context) * .05,
              top: CustomMediaQuery.height(context) * .3,
              bottom: CustomMediaQuery.height(context) * .3),
          child: AlertDialog(
            backgroundColor: Palette.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  backgroundColor: Palette.bgGrey,
                  valueColor: AlwaysStoppedAnimation<Color>(Palette.tomato),
                ),
                VerticalSpacing(height: 20),
                CustomText(
                    text: message,
                    textAlign: TextAlign.center,
                    textColor: Palette.black,
                    fontWeight: FontWeight.w500)
              ],
            ),
          ),
        );
}
