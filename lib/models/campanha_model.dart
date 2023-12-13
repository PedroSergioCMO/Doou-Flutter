import 'dart:convert';

Campanha campanhaFromJson(String str) => Campanha.fromJson(json.decode(str));

String campanhaToJson(Campanha data) => json.encode(data.toJson());

class Campanha {
  int id; // Adicionei o campo id
  String nome;
  String descricao;
  // String criador;
  String imagemCapa;
  String imagens;
  double? meta;
  double? valorArrecadado;
  String categoria;

  Campanha({
    required this.id,
    required this.nome,
    required this.descricao,
    // required this.criador,
    required this.imagemCapa,
    required this.imagens,
    required this.meta,
    required this.valorArrecadado,
    required this.categoria,
  });

  factory Campanha.fromJson(Map<String, dynamic> json) => Campanha(
        id: json["id"] ?? 0,
        nome: json["nome"] ?? "",
        descricao: json["descricao"] ?? "",
        // criador: json["criador"] ?? "",
        imagemCapa: json["imagem_capa"] ?? "",
        imagens: json["imagens"] ?? "",
        meta: json["meta"]?.toDouble() ?? 0.0,
        valorArrecadado: json["valor_arrecadado"]?.toDouble() ?? 0.0,
        categoria: json["categoria"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "descricao": descricao,
        // "criador": criador,
        "imagem_capa": imagemCapa,
        "imagens": imagens,
        "meta": meta,
        "valor_arrecadado": valorArrecadado,
        "categoria": categoria,
      };
}
