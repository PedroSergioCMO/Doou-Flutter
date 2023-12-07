import 'dart:convert';
import 'dart:io';

// import 'package:Doou-Flutter/models/usuario.dart';

import 'package:doou/models/usuario_model.dart';
import 'package:http/http.dart' as http;

class UsuarioRepository {
  final String baseUrl = 'http://localhost:3000'; // Substitua pela sua URL

  Future<Usuario> getUsuarioById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/usuarios/$id'));

    if (response.statusCode == 200) {
      return Usuario.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao buscar usuário por ID');
    }
  }

  Future<Usuario> criarNovoUsuario(Usuario novoUsuario) async {
    final response = await http.post(
      Uri.parse('$baseUrl/usuarios'),
      headers: {'Content-Type': 'application/json'},
      body: usuarioToJson(novoUsuario),
    );

    if (response.statusCode == 201) {
      return Usuario.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao criar novo usuário');
    }
  }

  Future<Usuario> editarUsuario(Usuario usuarioEditado) async {
    final response = await http.put(
      Uri.parse('$baseUrl/usuarios/${usuarioEditado.id}'),
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
