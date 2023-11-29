import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Campanha {
  String nome;
  String descricao;
  String criador; //Creador da campanha;
  String imagem_capa;
  String imagens;
  double meta;
  double valorArrecadado;
  String categoria;

  Campanha(this.nome, this.descricao, this.criador, this.imagem_capa,
      this.imagens, this.meta, this.valorArrecadado, this.categoria);
}
