import 'dart:convert';
import 'package:doou/models/campanha_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CampanhaRepository {
  final String baseUrl = 'http://172.17.113.143:3000'; // Substitua pela sua URL

  Future<Campanha> getCampanhaById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/campanha/$id'));

    if (response.statusCode == 200) {
      return Campanha.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao buscar campanha por ID');
    }
  }

  Future<Campanha> criarNovaCampanha(Campanha novaCampanha) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    String? token = _sharedPreferences.getString('token');

    final response = await http.post(
      Uri.parse('$baseUrl/campanha/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: campanhaToJson(novaCampanha),
    );

    if (response.statusCode == 200) {
      Get.snackbar('Sucesso', 'Campanha Cadastrada!',
          backgroundColor: Colors.green);
      return Campanha.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      Get.snackbar('Erro', response.body, backgroundColor: Colors.red);
      throw Exception('Falha ao criar nova campanha');
    } else {
      Get.snackbar('Erro', 'Falha ao criar nova campanha!',
          backgroundColor: Colors.red);
      throw Exception('Falha ao criar nova campanha');
    }
  }

  Future<Campanha> editarCampanha(Campanha campanhaEditada) async {
    final response = await http.put(
      Uri.parse('$baseUrl/campanha/${campanhaEditada.id}'),
      headers: {'Content-Type': 'application/json'},
      body: campanhaToJson(campanhaEditada),
    );

    if (response.statusCode == 200) {
      return Campanha.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao editar campanha');
    }
  }
}
