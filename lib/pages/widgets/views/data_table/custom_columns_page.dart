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

  Widget build(BuildContext context) {
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
                _builderHeader(),
                UIHelper.dividerDefault,
                UIHelper.verticalSpaceSmall,
                Obx(() => _builderBody(context)),
                UIHelper.verticalSpaceMedium,
                _builderButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _builderHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
        ),
        const Text(
          'Columns',
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

  Widget _builderBody(BuildContext context) {
    var list = controller.columns.value;

    return Column(
      children: [
        CheckboxListTile(
          title: Text(controller.checkAll.value ? Mensagens.instance.selectAll : Mensagens.instance.noSelectAll),
          value: controller.checkAll.value,
          onChanged: (bool? value) {
            controller.toggleCheckAll(value);
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (_, int index) {
            return _checkBoxItem(list[index]);
          },
        ),
      ],
    );
  }

  Widget _builderButtons() {
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

  Widget _checkBoxItem(CheckBoxModel item) {
    return CheckboxListTile(
      title: Text(item.text),
      value: item.checked,
      onChanged: (bool? value) {
        controller.changeCheck(item);
      },
    );
  }
}
