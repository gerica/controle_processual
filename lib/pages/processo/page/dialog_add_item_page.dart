import 'package:controle_processual/domain/enum/status.dart';
import 'package:controle_processual/pages/base/page/base_page.dart';
import 'package:controle_processual/pages/processo/controller/dialog_add_item_controller.dart';
import 'package:controle_processual/pages/widgets/buttons/primary_button.dart';
import 'package:controle_processual/pages/widgets/text_field/input_text_widget.dart';
import 'package:controle_processual/utils/app_border_radius.dart';
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:controle_processual/utils/app_font_size.dart';
import 'package:controle_processual/utils/app_font_weight.dart';
import 'package:controle_processual/utils/app_spacing.dart';
import 'package:controle_processual/utils/mensagens.dart';
import 'package:controle_processual/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DialogAddItemPage extends GetView<DialogAddItemController> with BasePage {
  // final VoidCallback? onClosePressed;
  // final ValueSetter<dynamic>? onOkPressed;

  const DialogAddItemPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          // width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
          padding: const EdgeInsets.all(AppSpacing.medium),
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.medium,
            color: AppColorScheme.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                  ),
                  Text(
                    Mensagens.instance.titleAdditem,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black, fontSize: AppFontSize.medium, fontWeight: AppFontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.close();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              UIHelper.dividerDefault,
              UIHelper.verticalSpaceSmall,
              _buildForms(context),
              UIHelper.verticalSpaceMedium,
              _buildActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForms(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 10,
      runSpacing: 10,
      children: [
        InputTextWidget(
          hintText: Mensagens.instance.textCidade,
          textCapitalization: TextCapitalization.words,
          controller: controller.cidadeController,
          errorText: controller.cidadeError.value == '' ? null : controller.cidadeError.value,
          focusNode: controller.cidadeFocus,
          onFieldSubmitted: () {
            if (controller.cidadeError.value.isNotEmpty) {
              controller.cidadeError('');
            }
          },
          textInputAction: TextInputAction.next,
        ),
        UIHelper.verticalSpaceExtraTiny,
        InputTextWidget(
          hintText: Mensagens.instance.textNucleo,
          textCapitalization: TextCapitalization.words,
          controller: controller.nucleoController,
          errorText: controller.nucleoError.value == '' ? null : controller.nucleoError.value,
          focusNode: controller.nucleoFocus,
          onFieldSubmitted: () {
            if (controller.nucleoError.value.isNotEmpty) {
              controller.nucleoError('');
            }
          },
          textInputAction: TextInputAction.next,
        ),
        UIHelper.verticalSpaceExtraTiny,
        InputTextWidget(
          hintText: Mensagens.instance.textDetalhamentoTemaProcesso,
          textCapitalization: TextCapitalization.words,
          controller: controller.detalhamentoTemaProcessoController,
          errorText: controller.detalhamentoTemaProcessoError.value == ''
              ? null
              : controller.detalhamentoTemaProcessoError.value,
          focusNode: controller.detalhamentoTemaProcessoFocus,
          onFieldSubmitted: () {
            if (controller.detalhamentoTemaProcessoError.value.isNotEmpty) {
              controller.detalhamentoTemaProcessoError('');
            }
          },
          textInputAction: TextInputAction.next,
        ),
        UIHelper.verticalSpaceExtraTiny,
        InputTextWidget(
          hintText: Mensagens.instance.textTipo,
          textCapitalization: TextCapitalization.words,
          controller: controller.tipoController,
          errorText: controller.tipoError.value == '' ? null : controller.tipoError.value,
          focusNode: controller.tipoFocus,
          onFieldSubmitted: () {
            if (controller.tipoError.value.isNotEmpty) {
              controller.tipoError('');
            }
          },
          textInputAction: TextInputAction.next,
        ),
        UIHelper.verticalSpaceExtraTiny,
        InputTextWidget(
          hintText: Mensagens.instance.textAcao,
          textCapitalization: TextCapitalization.words,
          controller: controller.acaoController,
          errorText: controller.acaoError.value == '' ? null : controller.acaoError.value,
          focusNode: controller.acaoFocus,
          onFieldSubmitted: () {
            if (controller.acaoError.value.isNotEmpty) {
              controller.acaoError('');
            }
          },
          textInputAction: TextInputAction.next,
        ),
        UIHelper.verticalSpaceExtraTiny,
        _buildItemDatePicker(context, controller.inicioPrevistoController, Mensagens.instance.textInicioPrevisto),
        UIHelper.verticalSpaceExtraTiny,
        _buildItemDatePicker(context, controller.terminoPrevistoController, Mensagens.instance.textTerminoPrevisto),
        UIHelper.verticalSpaceExtraTiny,
        _buildItemDatePicker(context, controller.terminoRealController, Mensagens.instance.textTerminoReal),
        UIHelper.verticalSpaceExtraTiny,
        InputTextWidget(
          hintText: Mensagens.instance.textPrazoEntrega,
          textCapitalization: TextCapitalization.words,
          controller: controller.prazoEntregaController,
          errorText: controller.prazoEntregaError.value == '' ? null : controller.prazoEntregaError.value,
          focusNode: controller.prazoEntregaFocus,
          onFieldSubmitted: () {
            if (controller.prazoEntregaError.value.isNotEmpty) {
              controller.prazoEntregaError('');
            }
          },
          textInputAction: TextInputAction.next,
        ),
        UIHelper.verticalSpaceExtraTiny,
        InputTextWidget(
          hintText: Mensagens.instance.textStatus,
          textCapitalization: TextCapitalization.words,
          controller: controller.statusController,
          errorText: controller.statusError.value == '' ? null : controller.statusError.value,
          focusNode: controller.statusFocus,
          onFieldSubmitted: () {
            if (controller.statusError.value.isNotEmpty) {
              controller.statusError('');
            }
          },
          textInputAction: TextInputAction.next,
        ),
        UIHelper.verticalSpaceExtraTiny,
        InputTextWidget(
          hintText: Mensagens.instance.textObservacao,
          textCapitalization: TextCapitalization.words,
          controller: controller.observacaoController,
          errorText: controller.observacaoError.value == '' ? null : controller.observacaoError.value,
          focusNode: controller.observacaoFocus,
          onFieldSubmitted: () {
            if (controller.observacaoError.value.isNotEmpty) {
              controller.observacaoError('');
            }
          },
          textInputAction: TextInputAction.next,
        ),
        UIHelper.verticalSpaceExtraTiny,
        InputTextWidget(
          hintText: Mensagens.instance.textResponsavel,
          textCapitalization: TextCapitalization.words,
          controller: controller.responsavelAtualizacaoController,
          errorText:
              controller.responsavelAtualizacaoError.value == '' ? null : controller.responsavelAtualizacaoError.value,
          focusNode: controller.responsavelAtualizacaoFocus,
          onFieldSubmitted: () {
            if (controller.responsavelAtualizacaoError.value.isNotEmpty) {
              controller.observacaoError('');
            }
          },
          textInputAction: TextInputAction.next,
        ),
        UIHelper.verticalSpaceExtraTiny,
        _buildItemDatePicker(context, controller.ultimaAtualizacaoController, Mensagens.instance.textUltimaAtualizacao),
      ],
    );
  }

  Widget _buildItemDatePicker(BuildContext context, TextEditingController textController, String text) {
    return GestureDetector(
      onTap: () async {
        final result = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2021),
          lastDate: DateTime(2030),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.dark(
                  primary: AppColorScheme.primarySwatch,
                  onPrimary: AppColorScheme.white,
                  surface: AppColorScheme.primarySwatch,
                  onSurface: Colors.black,
                ),
              ),
              child: child ?? Container(),
            );
          },
        );
        if (result != null) {
          final valueDate = DateFormat('MM/dd/yyyy').format(result);
          textController.text = '$valueDate';
        }
      },
      child: AbsorbPointer(
        child: InputTextWidget(
          hintText: text,
          onFieldSubmitted: () {},
          borderColor: AppColorScheme.primarySwatch,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          controller: textController,
          suffixIcon: const Icon(
            Icons.date_range_outlined,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildActions() {
    List<Widget> itens = [];

    itens.add(
      PrimaryButton(
          width: 100,
          onPressed: () {
            controller.save();
          },
          title: "Salvar",
          color: PrimaryButtonColor.primary,
          type: PrimaryButtonType.circular,
          style: PrimaryButtonStyle.filled,
          state: Status.success),
    );

    itens.add(SizedBox(width: 10));
    itens.add(
      PrimaryButton(
          width: 100,
          onPressed: () {
            controller.close();
          },
          title: "Fechar",
          color: PrimaryButtonColor.error,
          type: PrimaryButtonType.circular,
          style: PrimaryButtonStyle.filled,
          state: Status.success),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: itens,
    );
  }
}
