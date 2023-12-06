import 'package:doou/widgets/text_field_adaptada.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cadastrosUsuario_page.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController _usuarioController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  bool _senhaVisibel = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(72, 141, 146, 1.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 80,
            child: Image.asset(
              "lib/assets/imgs/logo.jpeg",
              height: 200,
            ),
          ),
          Center(
            child: Card(
              color: Color.fromRGBO(95, 178, 184, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    text_field_adaptada(
                      labelText: "Usuário",
                      controller: _usuarioController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    text_field_adaptada(
                      obscureText: !_senhaVisibel,
                      labelText: "Senha",
                      controller: _senhaController,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
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
                            child: Text("Logar"),
                            onPressed: () {
                              Get.toNamed("/cadastroCampannha");
                              //logica para verificar se o usuario digitado existe no banco
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 30),
                          child: ElevatedButton(
                            child: Text("Cadastrar"),
                            onPressed: () {
                              Get.toNamed("/cadastro");
                            },
                          ),
                        )
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
  }
}
