import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario(
      {required this.id,
      required this.nome,
      required this.email,
      required this.cpf,
      required this.telefone,
      required this.senha,
      });

  int id;
  String nome;
  String email;
  String cpf;
  String telefone;
  String senha;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nome: json["nome"],
        email: json["email"],
        cpf: json["cpf"],
        telefone: json["telefone"],
        senha: json["senha"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "email": email,
        "cpf": cpf,
        "telefone": telefone,
        "senha": senha
      };
}
