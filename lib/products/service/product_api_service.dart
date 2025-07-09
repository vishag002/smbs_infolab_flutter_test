import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smbs_infolab_flutter_test/products/models/product_model.dart';
import 'package:smbs_infolab_flutter_test/utilis/constants.dart';

class ProductApiService {
  Future<List<ProductModel>> getItems() async {
    final response = await http.get(Uri.parse(productsUrl));

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      final List<dynamic> productjson = decode['products'];

      return productjson.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  Future<ProductModel> getItemByID(int id) async {
    final response = await http.get(Uri.parse(singleProductUrl(id)));

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      return ProductModel.fromJson(decode);
    } else {
      throw Exception("Failed to load product");
    }
  }

  Future<List<ProductModel>> searchItems(String query) async {
    final response = await http.get(Uri.parse(searchProductUrl(query)));

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      final List<dynamic> productjson = decode['products'];

      return productjson.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to search products");
    }
  }
}
