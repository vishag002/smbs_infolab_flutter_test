import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  Future<String?> login(String username, String password) async {
    final url = Uri.parse("https://dummyjson.com/auth/login");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['accessToken']; // only return the token
    } else {
      return null;
    }
  }
}
