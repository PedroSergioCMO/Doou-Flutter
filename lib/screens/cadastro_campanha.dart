//import 'package:doou/controllers/campanha_controller.dart';
import 'package:doou/models/campanha_model.dart';
import 'package:doou/widgets/newAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:doou/repositories/campanha_repository.dart';

class CadastroCampanhaScreen extends StatefulWidget {
  @override
  _CadastroCampanhaScreenState createState() => _CadastroCampanhaScreenState();
}

class _CadastroCampanhaScreenState extends State<CadastroCampanhaScreen> {
  CampanhaRepository campanhaRepository = CampanhaRepository();
  TextEditingController nomeController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController criadorController = TextEditingController();
  TextEditingController imagemCapaController = TextEditingController();
  TextEditingController imagensController = TextEditingController();
  TextEditingController metaController = TextEditingController();
  TextEditingController valorArrecadadoController = TextEditingController();
  TextEditingController categoriaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    verificarUsuario().then((temUsuario) => {
          if (temUsuario)
            {print("Tem usuário")}
          else
            {
              Get.toNamed("/"),
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newAppBar(
          //title: Text('Cadastro de Campanha'),
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: criadorController,
                decoration: InputDecoration(labelText: 'Criador'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: imagemCapaController,
                decoration: InputDecoration(labelText: 'Imagem de Capa'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: imagensController,
                decoration: InputDecoration(labelText: 'Imagens'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: metaController,
                decoration: InputDecoration(labelText: 'Meta'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: valorArrecadadoController,
                decoration: InputDecoration(labelText: 'Valor Arrecadado'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: categoriaController,
                decoration: InputDecoration(labelText: 'Categoria'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (nomeController.text != '' &&
                      descricaoController.text != '' &&
                      criadorController.text != '' &&
                      imagemCapaController.text != '' &&
                      imagensController.text != '' &&
                      metaController.text != '' &&
                      valorArrecadadoController.text != '' &&
                      categoriaController.text != '') {
                    Campanha novaCampanha = Campanha(
                        id: 0,
                        nome: nomeController.text,
                        descricao: descricaoController.text,
                        // criador: criadorController.text,
                        imagemCapa: imagemCapaController.text,
                        imagens: imagensController.text,
                        categoria: categoriaController.text,
                        meta: double.tryParse(metaController.text),
                        valorArrecadado: 0.0);

                    Campanha campanhaCadastrada = await campanhaRepository
                        .criarNovaCampanha(novaCampanha);
                    // print(usuarioCadastrado);

                    Get.toNamed("/home");
                  }
                  // Limpe os controladores após a adição
                  nomeController.clear();
                  descricaoController.clear();
                  criadorController.clear();
                  imagemCapaController.clear();
                  imagensController.clear();
                  metaController.clear();
                  valorArrecadadoController.clear();
                  categoriaController.clear();
                },
                child: Text('Cadastrar Campanha'),
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     SharedPreferences _sharePreference =
              //         await SharedPreferences.getInstance();

              //     String? token = _sharePreference.getString('token');

              //     if (token != null) {
              //       _sharePreference.remove('token');
              //       print('Token removido com sucesso.');
              //     } else {
              //       print('Nenhum token encontrado para remover.');
              //     }

              //     setState(() {
              //       verificarUsuario().then((temUsuario) => {
              //             if (temUsuario)
              //               {print("Tem usuário")}
              //             else
              //               {
              //                 Get.toNamed("/"),
              //               }
              //           });
              //     });
              //   },
              //   child: Text("logout"),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> verificarUsuario() async {
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  String? token = _sharedPreferences.getString('token');

  if (token == null) {
    return false;
  } else {
    return true;
  }
}
