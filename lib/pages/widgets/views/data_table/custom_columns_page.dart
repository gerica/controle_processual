import 'package:controle_processual/domain/model/checkbox_model.dart';
import 'package:controle_processual/pages/base/page/base_page.dart';
import 'package:controle_processual/pages/widgets/views/data_table/custom_columns_controller.dart';
import 'package:controle_processual/utils/mensagens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:controle_processual/domain/enum/status.dart';
import 'package:controle_processual/pages/widgets/buttons/primary_button.dart';
import 'package:controle_processual/utils/app_border_radius.dart';
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:controle_processual/utils/app_font_size.dart';
import 'package:controle_processual/utils/app_font_weight.dart';
import 'package:controle_processual/utils/app_spacing.dart';
import 'package:controle_processual/utils/ui_helper.dart';

class CustomColumnsPage extends GetView<CustomColumnsController> with BasePage {
  CustomColumnsPage({Key? key}) : super(key: key);

  Widget build2(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 500,
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
            padding: const EdgeInsets.all(AppSpacing.medium),
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.medium,
              color: AppColorScheme.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(),
                UIHelper.dividerDefault,
                UIHelper.verticalSpaceSmall,
                Obx(() => _buildBody(context)),
                UIHelper.verticalSpaceMedium,
                _buildActions()
              ],
            ),
          ),
        ),
      ),
    );
  }

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
              _buildHeader(),
              UIHelper.dividerDefault,
              UIHelper.verticalSpaceSmall,
              Obx(() => _buildBody(context)),
              UIHelper.verticalSpaceMedium,
              _buildActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
        ),
        const Text(
          'Colunas',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: AppFontSize.medium, fontWeight: AppFontWeight.bold),
        ),
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    var list = controller.columns.value;
    List<Widget> itens = [];
    itens.add(_buildItemAll());
    for (CheckBoxModel model in list) {
      final txtContr = TextEditingController();
      txtContr.text = '${model.order}';
      itens.add(_buildItem(model, txtContr));
    }

    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 10,
      runSpacing: 10,
      children: [
        ...itens,
      ],
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UIHelper.horizontalSpaceMedium,
        Container(
          width: 100,
          child: PrimaryButton(
            onPressed: () {
              controller.confirm();
            },
            title: Mensagens.instance.salvar,
            color: PrimaryButtonColor.primary,
            type: PrimaryButtonType.circular,
            style: PrimaryButtonStyle.filled,
            state: Status.success,
          ),
        ),
        UIHelper.horizontalSpaceSmall,
        Container(
          width: 100,
          child: PrimaryButton(
            onPressed: () {
              Get.back();
            },
            title: Mensagens.instance.fechar,
            color: PrimaryButtonColor.error,
            type: PrimaryButtonType.circular,
            style: PrimaryButtonStyle.filled,
            state: Status.success,
          ),
        ),
      ],
    );
  }

  Widget _buildItem(CheckBoxModel item, TextEditingController txtContr) {
    var text = item.text;
    if (text.length >= 15) {
      text = '${text.substring(0, 15)}...';
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.medium,
        color: AppColorScheme.white,
        border: Border.all(),
      ),
      width: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            Row(
              children: [
                Container(
                  // color: Colors.yellow,
                  width: 40,
                  height: 30,
                  child: Focus(
                    child: TextField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
                      ),
                      controller: txtContr,
                    ),
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        if (txtContr.text != null) {
                          controller.changeOrder(item, int.parse(txtContr.text));
                        }
                      }
                    },
                  ),
                ),
                _checkBoxItem(item),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkBoxItem(CheckBoxModel item) {
    return Checkbox(
      // title:
      value: item.checked,
      onChanged: (bool? value) {
        controller.changeCheck(item);
      },
    );
  }

  Widget _buildItemAll() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.medium,
        color: AppColorScheme.white,
        border: Border.all(),
      ),
      width: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(controller.checkAll.value ? Mensagens.instance.selectAll : Mensagens.instance.noSelectAll),
            Checkbox(
              value: controller.checkAll.value,
              onChanged: (bool? value) {
                controller.toggleCheckAll(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
