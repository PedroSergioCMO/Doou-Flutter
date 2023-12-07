import 'dart:convert';
import 'dart:io';

// import 'package:Doou-Flutter/models/usuario.dart';

import 'package:doou/models/login_model.dart';
import 'package:doou/models/usuario_model.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  final String baseUrl = 'http://172.17.104.197:3000';

  Future<Login> login(Login login) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/'),
      headers: {'Content-Type': 'application/json'},
      body: LoginToJson(login),
    );

    if (response.statusCode == 200) {
      return Login.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao criar novo usuário');
    }
  }

}