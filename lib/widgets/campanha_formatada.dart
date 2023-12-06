import 'package:doou/controllers/campanha_controller.dart';
import 'package:doou/models/campanha_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampanhaFormatada extends StatefulWidget {
  Campanha campanha;

  CampanhaFormatada(this.campanha);

  @override
  State<CampanhaFormatada> createState() => _CampanhaFormatadaState();
}

class _CampanhaFormatadaState extends State<CampanhaFormatada> {
  late Campanha _campanha;
  final CampanhaController = Get.find();

  @override
  void initState() {
    super.initState();
    _campanha = widget.campanha;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.all(10),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _campanha.nome,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  _campanha.meta.toStringAsFixed(2),
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
