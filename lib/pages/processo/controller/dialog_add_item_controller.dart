import 'package:controle_processual/domain/enum/status.dart';
import 'package:controle_processual/domain/model/cidade.dart';
import 'package:controle_processual/domain/model/option.dart';
import 'package:controle_processual/domain/model/processo.dart';
import 'package:controle_processual/domain/repository/processo_respository.dart';
import 'package:controle_processual/pages/base/controller/base_controller.dart';
import 'package:controle_processual/pages/widgets/views/app_ui_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DialogAddItemController extends BaseController {
  static DialogAddItemController get to => Get.isRegistered<DialogAddItemController>()
      ? Get.find<DialogAddItemController>()
      : Get.put(DialogAddItemController());

  final repository = ProcessoRepository();
  final processo = Processo.empty().obs;

  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController nucleoController = TextEditingController();
  final TextEditingController detalhamentoTemaController = TextEditingController();
  final TextEditingController processoController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController acaoController = TextEditingController();
  final TextEditingController prazoEntregaController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController observacaoController = TextEditingController();
  final TextEditingController responsavelAtualizacaoController = TextEditingController();
  final TextEditingController inicioPrevistoController = TextEditingController();
  final TextEditingController terminoPrevistoController = TextEditingController();
  final TextEditingController terminoRealController = TextEditingController();
  final TextEditingController ultimaAtualizacaoController = TextEditingController();

  List<String> get status => ['Em Andamento', 'Planejado', 'Atrasado', 'Concluído'];

  initCampos() {
    if (processo.value != null && processo.value.id != null) {
      var objProcesso = processo.value;
      cidadeController.text = objProcesso.cidade!;
      nucleoController.text = objProcesso.nucleo!;
      detalhamentoTemaController.text = objProcesso.detalhamentoTema!;
      processoController.text = objProcesso.processo!;
      tipoController.text = objProcesso.tipo!;
      acaoController.text = objProcesso.tipo!;
      if (objProcesso.inicioPrevisto != null) {
        inicioPrevistoController.text = DateFormat('dd/MM/yyyy').format(objProcesso.inicioPrevisto!);
      }
      if (objProcesso.terminoPrevisto != null) {
        terminoPrevistoController.text = DateFormat('dd/MM/yyyy').format(objProcesso.terminoPrevisto!);
      }
      if (objProcesso.terminoReal != null) {
        terminoRealController.text = DateFormat('dd/MM/yyyy').format(objProcesso.terminoReal!);
      }
      prazoEntregaController.text = objProcesso.prazoEntrega!;
      statusController.text = objProcesso.status!;
      observacaoController.text = objProcesso.observacao!;
      responsavelAtualizacaoController.text = objProcesso.responsavelAtualizacao!;
      if (objProcesso.ultimaAtualizacao != null) {
        ultimaAtualizacaoController.text = DateFormat('dd/MM/yyyy').format(objProcesso.ultimaAtualizacao!);
      }
    }
  }

  void close({Status status = Status.none}) {
    Get.delete<DialogAddItemController>();
    Get.back(result: status);
  }

  Future<void> save() async {
    final processo = Processo(
        acao: acaoController.text,
        detalhamentoTema: detalhamentoTemaController.text,
        processo: processoController.text,
        nucleo: nucleoController.text,
        cidade: cidadeController.text,
        observacao: observacaoController.text,
        prazoEntrega: prazoEntregaController.text,
        responsavelAtualizacao: responsavelAtualizacaoController.text,
        status: statusController.text,
        tipo: tipoController.text,
        inicioPrevisto: inicioPrevistoController.text.isNotEmpty
            ? DateFormat('dd/MM/yyyy').parse(inicioPrevistoController.text)
            : null,
        terminoPrevisto: terminoPrevistoController.text.isNotEmpty
            ? DateFormat('dd/MM/yyyy').parse(terminoPrevistoController.text).toLocal()
            : null,
        terminoReal: terminoRealController.text.isNotEmpty
            ? DateFormat('dd/MM/yyyy').parse(terminoRealController.text).toLocal()
            : null,
        ultimaAtualizacao: ultimaAtualizacaoController.text.isNotEmpty
            ? DateFormat('dd/MM/yyyy').parse(ultimaAtualizacaoController.text).toLocal()
            : null,
        id: this.processo.value.id);

    AppUIBlock.blockUI(context: Get.context);
    await repository.salvar(processo);
    AppUIBlock.unblock(context: Get.context);
    close(status: Status.success);
  }

  Future<void> delete() async {
    AppUIBlock.blockUI(context: Get.context);
    await repository.delete(processo.value);
    AppUIBlock.unblock(context: Get.context);
    close(status: Status.success);
  }

  Future<void> finalizar() async {
    AppUIBlock.blockUI(context: Get.context);
    await repository.finalizar(processo.value);
    AppUIBlock.unblock(context: Get.context);
    close(status: Status.success);
  }

  void calcularPrazo() {
    if (terminoPrevistoController.text.isNotEmpty && terminoRealController.text.isNotEmpty) {
      final difference = DateFormat('dd/MM/yyyy')
          .parse(terminoPrevistoController.text)
          .toLocal()
          .difference(DateFormat('dd/MM/yyyy').parse(terminoRealController.text).toLocal())
          .inDays;
      prazoEntregaController.text = '$difference';
    } else {
      prazoEntregaController.clear();
    }
  }

  Iterable<Option> getSuggestions(String pattern) {
    return CidadeDados.getCidades().where((cidade) {
      final nameLower = cidade.nome.toLowerCase();
      final queryLower = pattern.toLowerCase();
      return nameLower.contains(queryLower);
    });
  }
}
