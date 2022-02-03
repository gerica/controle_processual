import 'package:controle_processual/domain/enum/status.dart';
import 'package:controle_processual/pages/processo/controller/processo_controller.dart';
import 'package:controle_processual/pages/widgets/buttons/primary_button.dart';
import 'package:controle_processual/pages/widgets/views/data_table/row_data_table.dart';
import 'package:controle_processual/utils/mensagens.dart';
import 'package:controle_processual/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:controle_processual/pages/base/page/base_page.dart';
import 'package:controle_processual/pages/widgets/views/navigation_bar.dart' as localNav;
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:controle_processual/utils/constants.dart';

class ProcessoPage extends GetView<ProcessoController> with BasePage {
  final _scrollController = ScrollController(initialScrollOffset: 0.0);

  @override
  Widget build(BuildContext context) {
    controller.size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            localNav.NavigationBar(index: KHomeIndex),
            Obx(() => _buildBody(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: controller.size.width,
      color: AppColorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleTable(context),
          UIHelper.dividerDefault,
          _buildTable(context),
        ],
      ),
    );
  }

  Widget _buildTitleTable(BuildContext context) {
    var title = "Controle Processual";
    // if (controller.selected.value.id != null) {
    //   title = "Exams of device: ${controller.selected.value.serialNumber}";
    // }

    return Stack(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Positioned(
          right: 120,
          top: 10,
          child: PrimaryButton(
              width: 100,
              onPressed: () => controller.dialogCustomColumns(),
              title: Mensagens.instance.textColumns,
              color: PrimaryButtonColor.primary,
              type: PrimaryButtonType.circular,
              style: PrimaryButtonStyle.filled,
              state: Status.success),
          // child: ElevatedButton(
          //   onPressed: () => controller.addItemDialog(),
          //   child: Text(Mensagens.instance.textAddItem),
          // ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: PrimaryButton(
              width: 100,
              onPressed: () => controller.addItemDialog(),
              title: Mensagens.instance.textAddItem,
              color: PrimaryButtonColor.primary,
              type: PrimaryButtonType.circular,
              style: PrimaryButtonStyle.filled,
              state: Status.success),
          // child: ElevatedButton(
          //   onPressed: () => controller.addItemDialog(),
          //   child: Text(Mensagens.instance.textAddItem),
          // ),
        ),
      ],
    );
  }

  Widget _buildTable(BuildContext context) {
    if (controller.dados.value.isEmpty) {
      return SizedBox.shrink();
    }
    List<DataColumn> columns = [];
    List<String> columnsName = controller.columnsName;

    for (final model in columnsName) {
      columns.add(
        DataColumn(
          // onSort: (columnIndex, ascending) => controller.sortBy(columnIndex, ascending),
          label: Text(
            model,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 11),
          ),
        ),
      );
    }

    List<DataRow> rows = [];
    var rowDataTable = RowDataTable(context: context, onTapItem: (data) => print('ProcessoPage._buildTable: ${data}'));

    if (controller.dados.value.isNotEmpty) {
      for (final dado in controller.dados.value) {
        rows.add(
          DataRow(cells: rowDataTable.mount(data: dado, list: controller.columns.value)),
        );
      }
    }

    return Center(
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[100],
          border: Border.all(),
        ),
        child: Scrollbar(
          controller: _scrollController,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: columns,
                rows: rows,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
