import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginUseCase {
  final String apiUrl = 'http://localhost:8080/login';

  Future<String> login(
      {required String username, required String password}) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body['token']; // Supondo que o token esteja nesta chave
    } else {
      throw Exception('Falha ao fazer login');
    }
  }
}
