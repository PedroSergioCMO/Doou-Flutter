import 'package:doou/models/campanha_model.dart';
import 'package:get/get.dart';

class CampanhaController extends GetxController {
  List<Campanha> _campanhas = List<Campanha>.empty(growable: true).obs;

  List<Campanha> get cartItens => _campanhas;

  double get totalMeta {
    double total = 0.0;
    _campanhas.forEach((campanha) {
      total += campanha.meta;
    });
    return total;
  }

  void add(Campanha campanha) {
    _campanhas.add(campanha);
  }

  void remove(Campanha campanha) {
    _campanhas.remove(campanha);
  }
}
