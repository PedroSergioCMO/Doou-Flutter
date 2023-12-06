import 'package:doou/controllers/campanha_controller.dart';
import 'package:doou/widgets/newAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroCampanhaScreen extends StatefulWidget {
  @override
  _CadastroCampanhaScreenState createState() => _CadastroCampanhaScreenState();
}

class _CadastroCampanhaScreenState extends State<CadastroCampanhaScreen> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController criadorController = TextEditingController();
  TextEditingController imagemCapaController = TextEditingController();
  TextEditingController imagensController = TextEditingController();
  TextEditingController metaController = TextEditingController();
  TextEditingController valorArrecadadoController = TextEditingController();
  TextEditingController categoriaController = TextEditingController();

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
                onPressed: () {
                  CampanhaController campanhaController = Get.find();
                  // Chame o método adicionarCampanha do controlador
                  campanhaController.adicionarCampanha(
                    nome: nomeController.text,
                    descricao: descricaoController.text,
                    criador: criadorController.text,
                    imagemCapa: imagemCapaController.text,
                    imagens: imagensController.text,
                    meta: double.parse(metaController.text),
                    valorArrecadado:
                        double.parse(valorArrecadadoController.text),
                    categoria: categoriaController.text,
                  );

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
            ],
          ),
        ),
      ),
    );
  }
}
