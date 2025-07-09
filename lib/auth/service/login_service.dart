import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smbs_infolab_flutter_test/utilis/constants.dart';

class LoginService {
  Future<String?> login(String username, String password) async {
    final url = Uri.parse(loginUrl);

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
