import 'package:controle_processual/domain/model/processo.dart';
import 'package:controle_processual/utils/constants.dart';
import 'package:controle_processual/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class RowDataTable {
  final ValueSetter<dynamic> onTapItem;
  BuildContext context;

  RowDataTable({required this.onTapItem, required this.context});

  List<DataCell> mount({required Processo data, required List<dynamic> list}) {
    List<DataCell> cells = [];

    for (int x = 0; x < list.length; x++) {
      var item = list[x];
      if (item.checked) {
        cells.add(_buildItem(data, item));
      }
    }

    return cells;
  }

  DataCell _rowString(String text, Processo data) {
    return DataCell(
      Text(
        '${text}'.showSizeMax(30),
        style: Theme.of(context).textTheme.bodyText1,
      ),
      onTap: () => onTapItem(data),
    );
  }

  DataCell _rowData(DateTime? date, Processo data) {
    var text = '';
    if (date != null) {
      text = '${DateFormat('dd/MM/yyyy').format(date as DateTime)}';
    }
    return DataCell(
      Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      onTap: () => onTapItem(data),
    );
  }

  DataCell _buildItem(Processo data, item) {
    switch (item.text) {
      case KCidade:
        return _rowString(data.cidade ?? "", data);

      case KNucleo:
        return _rowString(data.nucleo ?? "", data);

      case KDetalhamento:
        return _rowString(data.detalhamentoTemaProcesso ?? "", data);
      case KTipo:
        return _rowString(data.tipo ?? "", data);
      case KAcao:
        return _rowString(data.acao ?? "", data);
      case KInicioPrevito:
        return _rowData(data.inicioPrevisto, data);
      case KTerminoPrevisto:
        return _rowData(data.terminoPrevisto, data);
      case KTerminoReal:
        return _rowData(data.terminoReal, data);
      case KPrazoEntrega:
        return _rowString(data.prazoEntrega ?? "", data);
      case KStatus:
        return _rowString(data.status ?? "", data);
      case KObservacao:
        return _rowString(data.observacao ?? "", data);
      case KResponsavel:
        return _rowString(data.responsavelAtualizacao ?? "", data);
      case KultimaAtualizacao:
        return _rowData(data.ultimaAtualizacao ?? null, data);

      default:
        return DataCell(
          Text(
            "Need implementation",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10),
          ),
        );
    }
  }
}
