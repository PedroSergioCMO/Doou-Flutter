import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';

// import 'package:Doou-Flutter/models/usuario.dart';

import 'package:doou/models/login_model.dart';
import 'package:doou/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {

  final String baseUrl = 'http://10.1.4.12:3000';


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


        await _sharedpreference.setString('token', token);
        print(json.decode(response.body)['token']);


      Get.snackbar('Sucesso', 'Login bem-sucedido!',
          backgroundColor: Colors.green);

      return Login.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      Get.snackbar('Erro', 'Usuário não encontrado. Verifique suas credenciais',
          backgroundColor: Colors.red);
      throw Exception('Falha ao logar');
    } else {
      Get.snackbar('Erro', 'Falha ao logar. Verifique suas credenciais.',
          backgroundColor: Colors.red);
    }
    throw Exception('Falha ao logar');
  }

  //   try {
  //     final response = await http.post(
  //       Uri.parse('$baseUrl/login/'),
  //       headers: {'Content-Type': 'application/json'},
  //       body: LoginToJson(login),
  //     );

  //     if (response.statusCode == 200) {
  //       String token = json.decode(response.body)['token'];
  //       SharedPreferences _sharedpreference =
  //           await SharedPreferences.getInstance();
  //       await _sharedpreference.setString('token', 'token $token');

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Login bem-sucedido!'),
  //           backgroundColor: Colors.green,
  //         ),
  //       );
  //       Get.toNamed("/cadastroCampannha");
  //       // Você pode navegar para a próxima tela ou executar outras ações aqui após o login bem-sucedido.
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Falha ao logar. Verifique suas credenciais.'),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print('Erro ao realizar o login: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Erro ao realizar o login. Tente novamente.'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }
}
