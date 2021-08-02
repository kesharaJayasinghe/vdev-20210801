import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vdev20210801/components/customText.dart';
import 'package:vdev20210801/constants/customMediaQuery.dart';
import 'package:vdev20210801/constants/palette.dart';
import 'package:vdev20210801/screens/dashboard/providers/productProvider.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final double height = CustomMediaQuery.height(context);
    return Container(
      height: height * 0.58,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Palette.bgGrey),
      child: Consumer<ProductProvider>(
        builder: (context, state, child) {
          if (state.isError) {
            return Center(child: CustomText(text: 'Please try again!'));
          } else if ((state?.productModel?.length ?? 0) == 0) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: state?.productModel?.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Palette.white),
                  child: CustomText(
                      text: state.productModel[index].title,
                      textAlign: TextAlign.left),
                );
              });
        },
      ),
    );
  }
}
