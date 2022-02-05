import 'package:controle_processual/domain/enum/status.dart';
import 'package:controle_processual/domain/model/processo.dart';
import 'package:controle_processual/pages/base/page/base_page.dart';
import 'package:controle_processual/pages/processo/controller/dialog_add_item_controller.dart';
import 'package:controle_processual/pages/widgets/buttons/primary_button.dart';
import 'package:controle_processual/pages/widgets/text_field/dropdown_button_form_field_widget.dart';
import 'package:controle_processual/pages/widgets/text_field/input_text_widget.dart';
import 'package:controle_processual/utils/app_border_radius.dart';
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:controle_processual/utils/app_spacing.dart';
import 'package:controle_processual/utils/mensagens.dart';
import 'package:controle_processual/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DialogAddItemPage extends GetView<DialogAddItemController> with BasePage {
  // final VoidCallback? onClosePressed;
  // final ValueSetter<dynamic>? onOkPressed;

  DialogAddItemPage(Processo? processo) {
    controller.processo(processo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          // width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
          padding: const EdgeInsets.all(AppSpacing.small),
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
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  IconButton(
                    onPressed: () {
                      DialogAddItemController.to;
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
        _buildItemDatePicker(context, controller.inicioPrevistoController, Mensagens.instance.textInicioPrevisto),
        _buildItemDatePicker(context, controller.terminoPrevistoController, Mensagens.instance.textTerminoPrevisto),
        _buildItemDatePicker(context, controller.terminoRealController, Mensagens.instance.textTerminoReal),
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
          readOnly: true,
        ),
        _buildItemStatus(context),
        // InputTextWidget(
        //   hintText: Mensagens.instance.textStatus,
        //   textCapitalization: TextCapitalization.words,
        //   controller: controller.statusController,
        //   errorText: controller.statusError.value == '' ? null : controller.statusError.value,
        //   focusNode: controller.statusFocus,
        //   onFieldSubmitted: () {
        //     if (controller.statusError.value.isNotEmpty) {
        //       controller.statusError('');
        //     }
        //   },
        //   textInputAction: TextInputAction.next,
        // ),
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
        _buildItemDatePicker(context, controller.ultimaAtualizacaoController, Mensagens.instance.textUltimaAtualizacao),
      ],
    );
  }

  Widget _buildItemDatePicker(BuildContext context, TextEditingController textController, String text) {
    return GestureDetector(
      onTap: () async {
        final result = await showDatePicker(
          context: context,
          initialDate: textController.text.isNotEmpty
              ? DateFormat('dd/MM/yyyy').parse(textController.text).toLocal()
              : DateTime.now(),
          firstDate: DateTime(2010),
          lastDate: DateTime(2050),
          // locale: const Locale("br", "PT"),
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
          final valueDate = DateFormat('dd/MM/yyyy').format(result);
          textController.text = '$valueDate';
        } else {
          textController.clear();
        }
        controller.calcularPrazo();
      },
      child: AbsorbPointer(
        // child: Container(),
        child: InputTextWidget(
          hintText: text,
          onFieldSubmitted: () {},
          borderColor: AppColorScheme.primarySwatch,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          controller: textController,
          suffixIcon: const Icon(
            Icons.date_range_outlined,
            size: 25,
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
          title: Mensagens.instance.salvar,
          color: PrimaryButtonColor.primary,
          type: PrimaryButtonType.circular,
          style: PrimaryButtonStyle.filled,
          state: Status.success),
    );
    if (controller.processo.value.id != null) {
      itens.add(SizedBox(width: 10));
      itens.add(PrimaryButton(
          width: 100,
          onPressed: () {
            controller.finalizar();
          },
          title: Mensagens.instance.finalizar,
          color: PrimaryButtonColor.primary,
          type: PrimaryButtonType.circular,
          style: PrimaryButtonStyle.filled,
          state: Status.success));
      itens.add(SizedBox(width: 10));
      itens.add(PrimaryButton(
          width: 100,
          onPressed: () {
            controller.delete();
          },
          title: Mensagens.instance.apagar,
          color: PrimaryButtonColor.secondary,
          type: PrimaryButtonType.circular,
          style: PrimaryButtonStyle.filled,
          state: Status.success));
    }

    itens.add(SizedBox(width: 10));
    itens.add(
      PrimaryButton(
          width: 100,
          onPressed: () {
            DialogAddItemController.to;
            controller.close();
          },
          title: Mensagens.instance.fechar,
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

  Widget _buildItemStatus(BuildContext context) {
    String selected = controller.status[1];
    if (controller.processo.value != null && controller.processo.value.status != null) {
      selected = controller.processo.value.status!;
    }
    return DropdownButtonFormFieldWidget(
      hintText: Mensagens.instance.textStatus,
      selected: selected,
      borderColor: AppColorScheme.primarySwatch,
      onChanged: (dynamic newValue) {
        controller.statusController.text = newValue;
      },
      itens: controller.status.map((dynamic value) {
        return DropdownMenuItem<dynamic>(
          value: value,
          child: Text(value ?? ''),
        );
      }).toList(),
    );
  }
}
