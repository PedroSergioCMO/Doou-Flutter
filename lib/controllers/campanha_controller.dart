import 'package:doou/models/campanha_model.dart';
import 'package:get/get.dart';

class CampanhaController extends GetxController {
  var _campanhas = <Campanha>[].obs;

  List<Campanha> get campanhas => _campanhas;

  void adicionarCampanha({
    required String nome,
    required String descricao,
    required String criador,
    required String imagemCapa,
    required String imagens,
    required double meta,
    required double valorArrecadado,
    required String categoria,
  }) {
    Campanha novaCampanha = Campanha(
      nome,
      descricao,
      criador,
      imagemCapa,
      imagens,
      meta,
      valorArrecadado,
      categoria,
    );

    _campanhas.add(novaCampanha);
  }

  void removerCampanha(Campanha campanha) {
    _campanhas.remove(campanha);
  }
}
