import 'package:doou/widgets/appbar.dart';
import 'package:doou/widgets/campanha_formatada.dart';
import 'package:doou/widgets/newAppBar.dart';
import 'package:flutter/material.dart';
import 'package:doou/models/campanha_model.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List<Campanha> _lista = List<Campanha>.empty(growable: true);

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
    );
  }
}
