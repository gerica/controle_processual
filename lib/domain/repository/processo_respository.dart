import 'package:controle_processual/domain/model/processo.dart';

class ProcessoRepository {
  Future<void> salvar(Processo processo) async {
    Future.delayed(Duration(seconds: 1), () {
      print('ProcessoRepository.salvar: ${processo}');
    });
  }
}
