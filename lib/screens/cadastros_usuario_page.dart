import 'package:doou/models/usuario_model.dart';
import 'package:doou/repositories/usuario_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/text_field_adaptada.dart';

//   String nome;
//   String email;
//   String cpf; //Creador da campanha;
//   String telefone;
//   String senha;

class cadastro_usuario extends StatefulWidget {
  const cadastro_usuario({super.key});

  @override
  State<cadastro_usuario> createState() => _cadastro_usuarioState();
}

class _cadastro_usuarioState extends State<cadastro_usuario> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  bool _senhaVisibel = false;

  UsuarioRepository usuarioRepository = UsuarioRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(72, 141, 146, 1.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 25,
            child: Image.asset(
              "lib/assets/imgs/logo.jpeg",
              height: 150,
            ),
          ),
          Center(
            child: Card(
              color: Color.fromRGBO(95, 178, 184, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    text_field_adaptada(
                      labelText: "Nome",
                      controller: _nomeController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    text_field_adaptada(
                        labelText: "E-mail", controller: _emailController),
                    SizedBox(
                      height: 10,
                    ),
                    text_field_adaptada(
                        labelText: "Cpf", controller: _cpfController),
                    SizedBox(
                      height: 10,
                    ),
                    text_field_adaptada(
                        labelText: "Telefone", controller: _telefoneController),
                    SizedBox(
                      height: 10,
                    ),
                    text_field_adaptada(
                      obscureText: !_senhaVisibel,
                      labelText: "Senha",
                      controller: _senhaController,
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      suffixIcon: IconButton(
                        icon: _senhaVisibel
                            ? Icon(Icons.visibility, color: Colors.white)
                            : Icon(Icons.visibility_off, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _senhaVisibel = !_senhaVisibel;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 30),
                          child: ElevatedButton(
                            child: Text("Cadastrar"),
                            onPressed: () async {
                              if (_nomeController.text != '' &&
                                  _emailController.text != '' &&
                                  _cpfController.text != '' &&
                                  _telefoneController.text != '' &&
                                  _senhaController.text != '') {
                                Usuario novoUsuario = Usuario(
                                    id: "0",
                                    nome: _nomeController.text,
                                    email: _emailController.text,
                                    cpf: _cpfController.text,
                                    telefone: _telefoneController.text,
                                    senha: _senhaController.text);

                                Usuario usuarioCadastrado =
                                    await usuarioRepository
                                        .criarNovoUsuario(novoUsuario);
                                // print(usuarioCadastrado);

                                Get.toNamed("/");
                              }

                              //logica para enviar o usuario para API
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
