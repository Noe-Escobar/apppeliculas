import 'package:http/http.dart' as http;
import 'dart:convert';

Future? getToken(String user, String password) async {
  final reponse = await http.post(
      Uri.parse('https://fakestoreapi.com/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body:
          jsonEncode(<String, String>{'username': user, 'password': password}));
  if (reponse.statusCode == 200) {
    return jsonDecode(reponse.body);
  } else {
    return null;
  }
}
