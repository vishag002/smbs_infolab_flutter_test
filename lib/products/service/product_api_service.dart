import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smbs_infolab_flutter_test/products/models/product_model.dart';

class ProductApiService {
  final String baseUrl = "https://dummyjson.com";

  Future<List<ProductModel>> getItems(
    //{
    //required int limit,
    //required int skip,
    // }
  ) async {
    final response = await http.get(Uri.parse("$baseUrl/products"));

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      final List<dynamic> productjson = decode['products'];

      return productjson.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
