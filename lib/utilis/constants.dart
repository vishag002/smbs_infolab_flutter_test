import 'package:flutter/material.dart';

/// API URLs
const String baseUrl = 'https://dummyjson.com';
const String loginUrl = '$baseUrl/auth/login';
const String productsUrl = '$baseUrl/products';
const String addProductUrl = '$baseUrl/products/add';
String updateProductUrl(int id) => '$baseUrl/products/$id';
String deleteProductUrl(int id) => '$baseUrl/products/$id';
String searchProductUrl(String query) => '$baseUrl/products/search?q=$query';

/// SharedPreferences Keys
const String tokenKey = 'auth_token';

/// Colors
const Color primaryColor = Colors.blue;
const Color secondaryColor = Colors.grey;
const Color backgroundColor = Colors.white;
