/// API URLs
const String baseUrl = 'https://dummyjson.com';
const String loginUrl = '$baseUrl/auth/login';
const String productsUrl = '$baseUrl/products';
const String addProductUrl = '$baseUrl/products/add';
String singleProductUrl(int id) => '$baseUrl/products/$id';
String deleteProductUrl(int id) => '$baseUrl/products/$id';
String searchProductUrl(String query) => '$baseUrl/products/search?q=$query';

/// SharedPreferences Keys
const String tokenKey = 'auth_token';
