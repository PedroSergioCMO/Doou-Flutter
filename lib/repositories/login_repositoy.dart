import 'dart:convert';
import 'dart:io';

// import 'package:Doou-Flutter/models/usuario.dart';

import 'package:doou/models/login_model.dart';
import 'package:doou/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  final String baseUrl = 'http://10.1.1.134:3000';

  Future<Login> login(Login login) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/'),
      headers: {'Content-Type': 'application/json'},
      body: LoginToJson(login),
    );

    if (response.statusCode == 200) {
      String token = json.decode(response.body)['token'];
      SharedPreferences _sharedpreference =
          await SharedPreferences.getInstance() as SharedPreferences;

      await _sharedpreference.setString('token', 'token $token');
      print(json.decode(response.body)['token']);
      return Login.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao logar');
    }
  }
}
