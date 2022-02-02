import 'package:controle_processual/pages/processo/controller/dialog_add_item_controller.dart';
import 'package:controle_processual/pages/processo/page/dialog_add_item_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:controle_processual/pages/base/controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:controle_processual/pages/widgets/views/extension_dialog.dart';

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
      // dados.add(Processo(data: DateTime.now(), responsavel: 'Rogério Cardoso', prazo: DateTime.now()));
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

  Future<void> addItemDialog() async {
    DialogAddItemController.to;

    Get.appDialog(
      pageChild: DialogAddItemPage(),
    );
  }
}
