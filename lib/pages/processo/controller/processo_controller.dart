import 'dart:convert';

import 'package:controle_processual/domain/enum/status.dart';
import 'package:controle_processual/domain/model/checkbox_model.dart';
import 'package:controle_processual/domain/model/processo.dart';
import 'package:controle_processual/domain/repository/processo_respository.dart';
import 'package:controle_processual/pages/processo/controller/dialog_add_item_controller.dart';
import 'package:controle_processual/pages/processo/page/dialog_add_item_page.dart';
import 'package:controle_processual/pages/widgets/views/app_ui_block.dart';
import 'package:controle_processual/pages/widgets/views/data_table/custom_columns_controller.dart';
import 'package:controle_processual/pages/widgets/views/data_table/custom_columns_page.dart';
import 'package:controle_processual/utils/constants.dart';
import 'package:controle_processual/utils/local_storage.dart';
import 'package:controle_processual/utils/mensagens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:controle_processual/pages/base/controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:controle_processual/pages/widgets/views/extension_dialog.dart';

class ProcessoController extends BaseController {
  late Size size;
  final dados = [].obs;
  final columns = [].obs;

  final repository = ProcessoRepository();

  @override
  void onReady() async {
    super.onReady();
    await _recupear();
    await _fetchColumns();
  }

  Future<void> _recupear() async {
    dados.clear();
    AppUIBlock.blockUI(context: Get.context);
    final result = await repository.recuperarAtivos();
    dados.addAll(result);
    AppUIBlock.unblock(context: Get.context);
  }

  List<String> get columnsName {
    List<String> result = [];
    columns.value.forEach((col) {
      if (col.checked) {
        result.add(col.text);
      }
    });
    return result;
  }

  Future<void> _fetchColumns() async {
    String? columnsStr = await LocalStorage().get(KLocalStorageColumns);
    if (columnsStr == null || columnsStr.isEmpty) {
      columns.add(CheckBoxModel(text: KCidade, checked: true));
      columns.add(CheckBoxModel(text: KNucleo, checked: true));
      columns.add(CheckBoxModel(text: KDetalhamento, checked: true));
      columns.add(CheckBoxModel(text: KTipo, checked: true));
      columns.add(CheckBoxModel(text: KAcao, checked: true));
      columns.add(CheckBoxModel(text: KInicioPrevito, checked: true));
      columns.add(CheckBoxModel(text: KTerminoPrevisto, checked: true));
      columns.add(CheckBoxModel(text: KTerminoReal, checked: true));
      columns.add(CheckBoxModel(text: KPrazoEntrega, checked: true));
      columns.add(CheckBoxModel(text: KStatus, checked: true));
      columns.add(CheckBoxModel(text: KObservacao, checked: true));
      columns.add(CheckBoxModel(text: KResponsavel, checked: true));
      columns.add(CheckBoxModel(text: KultimaAtualizacao, checked: true));

      String columnsJson = jsonEncode(columns);
      LocalStorage().save(KLocalStorageColumns, columnsJson);
    }
    if (columnsStr != null && columnsStr.isNotEmpty) {
      List<dynamic> valueStrMap = jsonDecode(columnsStr) as List<dynamic>;
      if (valueStrMap.isNotEmpty) {
        valueStrMap.forEach((v) => columns.add(CheckBoxModel.fromJson(v)));
      }
    }
  }

  Future<void> addItemDialog(Processo? processo) async {
    if (Get.isSnackbarOpen) {
      print('ProcessoController.addItemDialog: snackbar open');
      // AppUIBlock.unblock(context: Get.context);
      Get.back();
    }

    DialogAddItemController.to;

    final result = await Get.appDialog(
      pageChild: DialogAddItemPage(processo),
    );
    if (result == Status.success) {
      snackBar(msg: Mensagens.instance.sucesso);
      await _recupear();
    } else if (result == Status.failed) {
      snackBarError(msg: Mensagens.instance.erro);
    }
  }

  void dialogCustomColumns() async {
    var controller = CustomColumnsController.to;
    controller.nameLocalStorage = KLocalStorageColumns;
    controller.columns.clear();
    controller.fetchExamsColumns();

    // isSorting(false);
    await Get.dialog(CustomColumnsPage());
    columns.clear();
    _fetchColumns();
    columns.refresh();
  }
}
