import 'package:controle_processual/pages/processo/controller/processo_controller.dart';
import 'package:controle_processual/pages/widgets/buttons/primary_button.dart';
import 'package:controle_processual/pages/widgets/buttons/primary_button_icon.dart';
import 'package:controle_processual/pages/widgets/text_field/input_text_widget.dart';
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
          UIHelper.dividerDefault,
          _buildTitleTable(context),
          UIHelper.dividerDefault,
          _buildPesquisa(context),
          UIHelper.dividerDefault,
          _buildTable(context),
        ],
      ),
    );
  }

  Widget _buildTitleTable(BuildContext context) {
    var title = "Controle Processual";

    return Stack(
      children: [
        Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        _buildActions()
      ],
    );
  }

  Widget _buildTable(BuildContext context) {
    if (controller.dados.value.isEmpty) {
      return Center(child: Text("Nenhum processo cadastrado"));
    }
    List<DataColumn> columns = [];
    List<String> columnsName = controller.columnsName;

    for (final model in columnsName) {
      columns.add(
        DataColumn(
          onSort: (columnIndex, ascending) => controller.sortBy(model, columnIndex, ascending),
          label: Text(
            model,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      );
    }

    List<DataRow> rows = [];
    var rowDataTable = RowDataTable(
      context: context,
      onTapItem: (data) => controller.addItemDialog(data),
    );

    if (controller.dados.value.isNotEmpty) {
      for (final dado in controller.dados.value) {
        rows.add(
          DataRow(
            color: controller.prazoNegativo(dado)
                ? MaterialStateColor.resolveWith((states) => LocalThemeColors.errorColor2[100] as Color)
                : MaterialStateColor.resolveWith((states) => AppColorScheme.white),
            cells: rowDataTable.mount(
              data: dado,
              list: controller.columns.value,
            ),
          ),
        );
      }
    }

    return Center(
      child: Container(
        margin: const EdgeInsets.all(8),
        // padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[100],
          border: Border.all(),
        ),
        child: Scrollbar(
          controller: _scrollController,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: controller.isSorting.value
                ? DataTable(
                    sortAscending: controller.sortAscending.value,
                    sortColumnIndex: controller.sortColumnIndex.value,
                    columns: columns,
                    rows: rows,
                  )
                : DataTable(
                    columns: columns,
                    rows: rows,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Positioned(
        right: 10,
        top: 10,
        child: Row(
          children: [
            PrimaryButtonIcon(
              onPressed: () => controller.download(),
              icon: Tooltip(
                child: const Icon(Icons.download, color: Colors.white),
                message: Mensagens.instance.downlaod,
              ),
              color: PrimaryButtonColor.primary,
              type: PrimaryButtonType.circular,
              style: PrimaryButtonStyle.filled,
            ),
            UIHelper.horizontalSpaceExtraTiny,
            PrimaryButtonIcon(
              onPressed: () => controller.dialogCustomColumns(),
              icon: Tooltip(
                child: const Icon(Icons.view_column, color: Colors.white),
                message: Mensagens.instance.textColumns,
              ),
              color: PrimaryButtonColor.primary,
              type: PrimaryButtonType.circular,
              style: PrimaryButtonStyle.filled,
            ),
            UIHelper.horizontalSpaceExtraTiny,
            PrimaryButtonIcon(
              onPressed: () => controller.addItemDialog(null),
              icon: Tooltip(
                child: const Icon(Icons.add, color: Colors.white),
                message: Mensagens.instance.textAddItem,
              ),
              color: PrimaryButtonColor.primary,
              type: PrimaryButtonType.circular,
              style: PrimaryButtonStyle.filled,
            ),
          ],
        ));
  }

  Widget _buildPesquisa(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          InputTextWidget(
            width: MediaQuery.of(context).size.width * 0.5,
            hintText: Mensagens.instance.pesquisar,
            textCapitalization: TextCapitalization.words,
            controller: controller.ctrPesquisar,
            onFieldSubmitted: () => controller.aplicarFiltro(),
            suffixIcon: GestureDetector(
              onTap: () => controller.aplicarFiltro(),
              child: Icon(Icons.search),
            ),
            textInputAction: TextInputAction.next,
          ),
          UIHelper.horizontalSpaceSmall,
          PrimaryButtonIcon(
            onPressed: () => controller.limparConsulta(),
            icon: Tooltip(
              child: const Icon(Icons.clear, color: Colors.white),
              message: Mensagens.instance.limpar,
            ),
            color: PrimaryButtonColor.primary,
            type: PrimaryButtonType.circular,
            style: PrimaryButtonStyle.filled,
          ),
        ],
      ),
    );
  }
}
