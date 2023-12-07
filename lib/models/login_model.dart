import 'dart:convert';

Login LoginFromJson(String str) => Login.fromJson(json.decode(str));

String LoginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({

    required this.email,
    required this.senha,
  });

  String email;
  String senha;

  factory Login.fromJson(Map<String, dynamic> json) => Login(

      email: json["email"] ?? "",
      senha: json["senha"] ?? "");

  Map<String, dynamic> toJson() => {
        "email": email,
        "senha": senha
      };
}
