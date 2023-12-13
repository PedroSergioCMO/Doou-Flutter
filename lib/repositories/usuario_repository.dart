import 'dart:convert';
import 'dart:io';

// import 'package:Doou-Flutter/models/usuario.dart';

import 'package:doou/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UsuarioRepository {

  final String baseUrl = 'http://10.1.4.12:3000'; // Substitua pela sua URL


  Future<Usuario> getUsuarioById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/usuario/$id'));

    if (response.statusCode == 200) {
      return Usuario.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao buscar usuário por ID');
    }
  }

  Future<Usuario> criarNovoUsuario(Usuario novoUsuario) async {
    final response = await http.post(
      Uri.parse('$baseUrl/usuario/'),
      headers: {'Content-Type': 'application/json'},
      body: usuarioToJson(novoUsuario),
    );

    if (response.statusCode == 200) {
      Get.snackbar('Sucesso', 'Usuário Cadastrado!',
          backgroundColor: Colors.green);
      return Usuario.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      Get.snackbar('Erro', response.body, backgroundColor: Colors.red);
      throw Exception('Falha ao criar novo usuário');
    } else {
      Get.snackbar('Erro', 'Falha ao criar novo usuário!',
          backgroundColor: Colors.red);
      throw Exception('Falha ao criar novo usuário');
    }
  }

  Future<Usuario> editarUsuario(Usuario usuarioEditado) async {
    final response = await http.put(
      Uri.parse('$baseUrl/usuario/${usuarioEditado.id}'),
      headers: {'Content-Type': 'application/json'},
      body: usuarioToJson(usuarioEditado),
    );

    if (response.statusCode == 200) {
      return Usuario.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao editar usuário');
    }
  }
}
