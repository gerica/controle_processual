import 'package:controle_processual/pages/processo/controller/processo_controller.dart';
import 'package:controle_processual/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:controle_processual/pages/base/page/base_page.dart';
import 'package:controle_processual/pages/widgets/views/navigation_bar.dart' as localNav;
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:controle_processual/utils/constants.dart';
import 'package:intl/intl.dart';

class ProcessoPage extends GetView<ProcessoController> with BasePage {
  @override
  Widget build(BuildContext context) {
    controller.size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            localNav.NavigationBar(index: KHomeIndex),
            Expanded(child: Obx(() => _buildBody(context))),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: controller.size.width,
          color: AppColorScheme.backgroundExtraLightPink,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("opcao 1"),
                  Row(
                    children: const [
                      Text("opcao 2"),
                      Text("opcao 3"),
                    ],
                  ),
                ],
              ),
              UIHelper.dividerDefault,
              _buildTitleTable(context),
              UIHelper.dividerDefault,
              _buildTable(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitleTable(BuildContext context) {
    var title = "Controle Processual";
    // if (controller.selected.value.id != null) {
    //   title = "Exams of device: ${controller.selected.value.serialNumber}";
    // }

    return Center(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Widget _buildTable(BuildContext context) {
    List<DataColumn> columns = [];
    List<String> columnsName = controller.columnsName;

    for (final name in columnsName) {
      columns.add(
        DataColumn(
          // onSort: (columnIndex, ascending) => controller.sortBy(columnIndex, ascending),
          label: Text(
            name,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 11),
          ),
        ),
      );
    }

    List<DataRow> rows = [];

    print('ProcessoPage._buildTable: ${controller.dados.value}');
    if (controller.dados.value.isNotEmpty) {
      for (final dado in controller.dados.value) {
        List<DataCell> cells = [];
        cells.add(
          DataCell(
            Text(
              '${DateFormat('dd/MM/yyyy kk:mm').format(dado.data)}',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10),
            ),
            onTap: () => print('ProcessoPage._buildTable: '),
          ),
        );
        cells.add(
          DataCell(
            Text(
              '${dado.responsavel}',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10),
            ),
            onTap: () => print('ProcessoPage._buildTable: '),
          ),
        );
        cells.add(
          DataCell(
            Text(
              '${DateFormat('dd/MM/yyyy kk:mm').format(dado.prazo)}',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10),
            ),
            onTap: () => print('ProcessoPage._buildTable: '),
          ),
        );
        rows.add(DataRow(cells: cells));
      }
    }

    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[100],
              border: Border.all(),
            ),
            child: DataTable(
              columns: columns,
              rows: rows,
            ),
          ),
        ],
      ),
    );
  }
}
