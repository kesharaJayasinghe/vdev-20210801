import 'package:flutter/material.dart';

import 'package:vdev20210801/components/customText.dart';

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Name: Keshara Jayasinghe'),
          CustomText(
              text:
                  'GitHub: https://github.com/kesharaJayasinghe/vdev-20210801'),
        ],
      ),
    );
  }
}
