import 'package:controle_processual/domain/enum/status.dart';
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

  final TextEditingController cidadeController = TextEditingController();
  final FocusNode cidadeFocus = FocusNode();
  final cidadeError = ''.obs;
  final TextEditingController nucleoController = TextEditingController();
  final FocusNode nucleoFocus = FocusNode();
  final nucleoError = ''.obs;
  final TextEditingController detalhamentoTemaProcessoController = TextEditingController();
  final FocusNode detalhamentoTemaProcessoFocus = FocusNode();
  final detalhamentoTemaProcessoError = ''.obs;
  final TextEditingController tipoController = TextEditingController();
  final FocusNode tipoFocus = FocusNode();
  final tipoError = ''.obs;
  final TextEditingController acaoController = TextEditingController();
  final FocusNode acaoFocus = FocusNode();
  final acaoError = ''.obs;
  final TextEditingController prazoEntregaController = TextEditingController();
  final FocusNode prazoEntregaFocus = FocusNode();
  final prazoEntregaError = ''.obs;
  final TextEditingController statusController = TextEditingController();
  final FocusNode statusFocus = FocusNode();
  final statusError = ''.obs;
  final TextEditingController observacaoController = TextEditingController();
  final FocusNode observacaoFocus = FocusNode();
  final observacaoError = ''.obs;
  final TextEditingController responsavelAtualizacaoController = TextEditingController();
  final FocusNode responsavelAtualizacaoFocus = FocusNode();
  final responsavelAtualizacaoError = ''.obs;

  final TextEditingController inicioPrevistoController = TextEditingController();
  final TextEditingController terminoPrevistoController = TextEditingController();
  final TextEditingController terminoRealController = TextEditingController();
  final TextEditingController ultimaAtualizacaoController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    cidadeController.text = "Cidade";
    nucleoController.text = "Nucleo";
    detalhamentoTemaProcessoController.text = "detalhamento";
    tipoController.text = "tipo";
    acaoController.text = "Acao";
    inicioPrevistoController.text = "10/10/2000";
    terminoPrevistoController.text = "10/10/2000";
    terminoRealController.text = "10/10/2000";
    prazoEntregaController.text = "Prazo";
    statusController.text = "Status";
    observacaoController.text = "Observacao";
    responsavelAtualizacaoController.text = "Responsavel";
    ultimaAtualizacaoController.text = "10/10/2000";
  }

  void close({Status status = Status.none}) {
    Get.delete<DialogAddItemController>();
    Get.back(result: status);
  }

  Future<void> save() async {
    final processo = Processo(
      acao: acaoController.text,
      detalhamentoTemaProcesso: detalhamentoTemaProcessoController.text,
      nucleo: nucleoController.text,
      cidade: cidadeController.text,
      observacao: observacaoController.text,
      prazoEntrega: prazoEntregaController.text,
      responsavelAtualizacao: responsavelAtualizacaoController.text,
      status: statusController.text,
      tipo: tipoController.text,
      inicioPrevisto: inicioPrevistoController.text.isNotEmpty
          ? DateFormat('MM/dd/yyyy').parse(inicioPrevistoController.text)
          : null,
      terminoPrevisto: terminoPrevistoController.text.isNotEmpty
          ? DateFormat('MM/dd/yyyy').parse(terminoPrevistoController.text).toLocal()
          : null,
      terminoReal: terminoRealController.text.isNotEmpty
          ? DateFormat('MM/dd/yyyy').parse(terminoRealController.text).toLocal()
          : null,
      ultimaAtualizacao: ultimaAtualizacaoController.text.isNotEmpty
          ? DateFormat('MM/dd/yyyy').parse(ultimaAtualizacaoController.text).toLocal()
          : null,
    );
    AppUIBlock.blockUI(context: Get.context);
    await repository.salvar(processo);
    AppUIBlock.unblock(context: Get.context);
    close(status: Status.success);
  }
}
