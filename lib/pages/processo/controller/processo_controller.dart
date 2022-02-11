import 'dart:convert';
import 'dart:html';

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
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:controle_processual/pages/base/controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:controle_processual/pages/widgets/views/extension_dialog.dart';

class ProcessoController extends BaseController {
  late Size size;
  final dados = [].obs;
  final dadosInical = [].obs;

  final columns = [].obs;
  final isSorting = false.obs;
  final sortAscending = false.obs;
  final sortColumnIndex = 0.obs;
  final TextEditingController ctrPesquisar = TextEditingController();

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
    dadosInical.addAll(result);
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
      columns.add(CheckBoxModel(text: KProcessoTxt, checked: true, order: 1));
      columns.add(CheckBoxModel(text: KCidade, checked: true, order: 1));
      columns.add(CheckBoxModel(text: KNucleo, checked: true, order: 2));
      columns.add(CheckBoxModel(text: KDetalhamento, checked: true, order: 3));
      columns.add(CheckBoxModel(text: KTipo, checked: true, order: 4));
      columns.add(CheckBoxModel(text: KAcao, checked: true, order: 5));
      columns.add(CheckBoxModel(text: KInicioPrevito, checked: true, order: 6));
      columns.add(CheckBoxModel(text: KTerminoPrevisto, checked: true, order: 7));
      columns.add(CheckBoxModel(text: KTerminoReal, checked: true, order: 8));
      columns.add(CheckBoxModel(text: KPrazoEntrega, checked: true, order: 9));
      columns.add(CheckBoxModel(text: KStatus, checked: true, order: 10));
      columns.add(CheckBoxModel(text: KObservacao, checked: true, order: 11));
      columns.add(CheckBoxModel(text: KResponsavel, checked: true, order: 12));
      columns.add(CheckBoxModel(text: KultimaAtualizacao, checked: true, order: 13));

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

  bool prazoNegativo(Processo dado) {
    if (dado.prazoEntrega != null && dado.prazoEntrega!.isNotEmpty && int.parse(dado.prazoEntrega as String) < 0) {
      return true;
    }
    return false;
  }

  Future<void> sortBy(String nameColumn, int columnIndex, bool ascending) async {
    isSorting(true);
    sortAscending(ascending);
    sortColumnIndex(columnIndex);

    switch (nameColumn) {
      case KCidade:
        if (ascending) {
          dados.value.sort((a, b) => a.cidade!.compareTo(b.cidade));
        } else {
          dados.value.sort((a, b) => b.cidade!.compareTo(a.cidade));
        }
        break;

      case KNucleo:
        if (ascending) {
          dados.value.sort((a, b) => a.nucleo!.compareTo(b.nucleo));
        } else {
          dados.value.sort((a, b) => b.nucleo!.compareTo(a.nucleo));
        }
        break;

      case KDetalhamento:
        if (ascending) {
          dados.value.sort((a, b) => a.detalhamentoTemaProcesso!.compareTo(b.detalhamentoTemaProcesso));
        } else {
          dados.value.sort((a, b) => b.detalhamentoTemaProcesso!.compareTo(a.detalhamentoTemaProcesso));
        }
        break;
      case KTipo:
        if (ascending) {
          dados.value.sort((a, b) => a.tipo!.compareTo(b.tipo));
        } else {
          dados.value.sort((a, b) => b.tipo!.compareTo(a.tipo));
        }
        break;
      case KAcao:
        if (ascending) {
          dados.value.sort((a, b) => a.acao!.compareTo(b.acao));
        } else {
          dados.value.sort((a, b) => b.acao!.compareTo(a.acao));
        }
        break;
      case KInicioPrevito:
        if (ascending) {
          dados.value.sort((a, b) => a.inicioPrevisto!.compareTo(b.inicioPrevisto));
        } else {
          dados.value.sort((a, b) => b.inicioPrevisto!.compareTo(a.inicioPrevisto));
        }
        break;
      case KTerminoPrevisto:
        if (ascending) {
          dados.value.sort((a, b) => a.terminoPrevisto!.compareTo(b.terminoPrevisto));
        } else {
          dados.value.sort((a, b) => b.terminoPrevisto!.compareTo(a.terminoPrevisto));
        }
        break;
      case KTerminoReal:
        if (ascending) {
          dados.value.sort((a, b) => a.terminoReal!.compareTo(b.terminoReal));
        } else {
          dados.value.sort((a, b) => b.terminoReal!.compareTo(a.terminoReal));
        }
        break;
      case KPrazoEntrega:
        if (ascending) {
          dados.value.sort((a, b) => a.prazoEntrega!.compareTo(b.prazoEntrega));
        } else {
          dados.value.sort((a, b) => b.prazoEntrega!.compareTo(a.prazoEntrega));
        }
        break;
      case KStatus:
        if (ascending) {
          dados.value.sort((a, b) => a.status!.compareTo(b.status));
        } else {
          dados.value.sort((a, b) => b.status!.compareTo(a.status));
        }
        break;
      case KObservacao:
        if (ascending) {
          dados.value.sort((a, b) => a.observacao!.compareTo(b.observacao));
        } else {
          dados.value.sort((a, b) => b.observacao!.compareTo(a.observacao));
        }
        break;
      case KResponsavel:
        if (ascending) {
          dados.value.sort((a, b) => a.responsavelAtualizacao!.compareTo(b.responsavelAtualizacao));
        } else {
          dados.value.sort((a, b) => b.responsavelAtualizacao!.compareTo(a.responsavelAtualizacao));
        }
        break;
      case KultimaAtualizacao:
        if (ascending) {
          dados.value.sort((a, b) => a.ultimaAtualizacao!.compareTo(b.ultimaAtualizacao));
        } else {
          dados.value.sort((a, b) => b.ultimaAtualizacao!.compareTo(a.ultimaAtualizacao));
        }
        break;

      default:
        break;
    }
  }

  Future<void> download() async {
    final List items = dados.value;
    List<List<dynamic>> rows = [[]];
    List<dynamic> row = [];

    row.add(KCidade);
    row.add(KNucleo);
    row.add(KDetalhamento);
    row.add(KTipo);
    row.add(KAcao);
    row.add(KInicioPrevito);
    row.add(KTerminoPrevisto);
    row.add(KTerminoReal);
    row.add(KPrazoEntrega);
    row.add(KStatus);
    row.add(KObservacao);
    row.add(KResponsavel);
    row.add(KultimaAtualizacao);

    rows.add(row);
    for (int i = 0; i < items.length; i++) {
      row = [];
      row.add(items[i].cidade);
      row.add(items[i].nucleo);
      row.add(items[i].detalhamentoTemaProcesso);
      row.add(items[i].tipo);
      row.add(items[i].acao);
      row.add(items[i].inicioPrevisto);
      row.add(items[i].terminoPrevisto);
      row.add(items[i].terminoReal);
      row.add(items[i].prazoEntrega);
      row.add(items[i].status);
      row.add(items[i].observacao);
      row.add(items[i].responsavelAtualizacao);
      row.add(items[i].ultimaAtualizacao);

      rows.add(row);
    }

    String csv = const ListToCsvConverter().convert(rows);
    // Encode our file in base64
    final _base64 = base64Encode(csv.codeUnits);
    // Create the link with the file
    final anchor = AnchorElement(href: 'data:application/octet-stream;base64,$_base64')..target = 'blank';
    anchor.download = "processos.csv";

    // trigger download
    document.body?.append(anchor);
    anchor.click();
    anchor.remove();
    return;
  }

  Future<void> aplicarFiltro() async {
    dados.clear();
    if (ctrPesquisar.text.isNotEmpty) {
      AppUIBlock.blockUI(context: Get.context);
      // final result = await repository.recuperarComFiltro_v1(ctrPesquisar.text);

      Future<void>.delayed(Duration(milliseconds: 500), () {
        for (Processo p in dadosInical) {
          if (p.cidade?.toLowerCase().contains(ctrPesquisar.text.toLowerCase()) as bool) {
            dados.add(p);
          } else if (p.processo?.toLowerCase().contains(ctrPesquisar.text.toLowerCase()) as bool) {
            dados.add(p);
          } else if (p.responsavelAtualizacao?.toLowerCase().contains(ctrPesquisar.text.toLowerCase()) as bool) {
            dados.add(p);
          } else if (p.status?.toLowerCase().contains(ctrPesquisar.text.toLowerCase()) as bool) {
            dados.add(p);
          } else if (p.nucleo?.toLowerCase().contains(ctrPesquisar.text.toLowerCase()) as bool) {
            dados.add(p);
          } else if (p.acao?.toLowerCase().contains(ctrPesquisar.text.toLowerCase()) as bool) {
            dados.add(p);
          }
        }
        AppUIBlock.unblock(context: Get.context);
      });
    } else {
      dados.addAll(dadosInical);
    }
  }

  void limparConsulta() {
    ctrPesquisar.clear();
    aplicarFiltro();
  }
}
