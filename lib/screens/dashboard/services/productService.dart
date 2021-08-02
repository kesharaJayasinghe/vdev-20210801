import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vdev20210801/models/productModel.dart';

class ApiProvider {
  static final ApiProvider _apiProvider = ApiProvider._internal();

  factory ApiProvider() {
    return _apiProvider;
  }

  ApiProvider._internal();

  List<ProductModel> _productList = [];

  Future<List<ProductModel>> getProducts() async {
    if ((_productList?.length ?? 0) != 0) return _productList;
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      _productList =
          jsonResponse.map((data) => ProductModel.fromJson(data)).toList();
      _productList.sort((a, b) {
        return a.title.toLowerCase().compareTo(b.title.toLowerCase());
      });
      return _productList;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
