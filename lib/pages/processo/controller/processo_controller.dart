import 'package:controle_processual/domain/model/processo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:controle_processual/pages/base/controller/base_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ProcessoController extends BaseController {
  late Size size;
  final dados = [].obs;

  @override
  void onReady() {
    super.onReady();
    this.recupear();
  }

  Future<void> recupear() async {
    Future.delayed(Duration(seconds: 1), () {
      print('recuperar apos um tempo');
      dados.add(Processo(data: DateTime.now(), responsavel: 'Rogério Cardoso', prazo: DateTime.now()));
    });
  }

  List<String> get columnsName {
    List<String> result = ['Data', 'Responsável', 'Prazo'];
    // columns.value.forEach((col) {
    //   if (col.checked) {
    //     result.add(col.text);
    //   }
    // });
    return result;
  }
}
