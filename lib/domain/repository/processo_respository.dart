import 'dart:io';

import 'package:controle_processual/domain/model/processo.dart';
import 'package:path_provider/path_provider.dart';

class ProcessoRepository {
  Future<void> salvar(Processo processo) async {
    Future.delayed(Duration(seconds: 1), () {
      print('ProcessoRepository.salvar: ${processo}');
    });
  }

  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory.path; // 2
    String filePath = '$appDocumentsPath/demoTextFile.txt'; // 3

    return filePath;
  }
}
