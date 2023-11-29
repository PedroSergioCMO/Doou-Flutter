import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Usuario {
  String nome;
  String email;
  String cpf; //Creador da campanha;
  String telefone;
  String senha;

  Usuario(this.nome, this.email, this.cpf, this.telefone, this.senha);
}
