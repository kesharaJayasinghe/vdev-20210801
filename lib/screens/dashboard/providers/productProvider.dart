import 'package:flutter/material.dart';

import 'package:vdev20210801/models/productModel.dart';
import 'package:vdev20210801/screens/dashboard/services/productService.dart';

class ProductProvider with ChangeNotifier {
  ApiProvider apiProvider = ApiProvider();

  List<ProductModel> _productModel;

  List<ProductModel> get productModel => _productModel;

  bool _isError = false;

  bool get isError => _isError;

  void getProducts() async {
    List<ProductModel> value = await apiProvider.getProducts();
    if (value != null) {
      _productModel = value;
    } else {
      _isError = true;
    }
    notifyListeners();
  }
}
