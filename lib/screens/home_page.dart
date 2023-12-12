import 'package:doou/widgets/appbar.dart';
import 'package:doou/widgets/campanha_formatada.dart';
import 'package:doou/widgets/newAppBar.dart';
import 'package:flutter/material.dart';
import 'package:doou/models/campanha_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List<Campanha> _lista = List<Campanha>.empty(growable: true);

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
      appBar: newAppBar(),
      body: ListView.builder(
        itemCount: _lista.length,
        itemBuilder: (context, position) {
          Campanha _campanha = _lista[position];
          return CampanhaFormatada(_campanha);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/cadastroCampanha");
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: const Color.fromRGBO(
            72, 141, 146, 1.0), // Ícone a ser exibido no botão
      ),
    );
  }

  Future<bool> verificarUsuario() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    String? token = _sharedPreferences.getString('token');

    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
