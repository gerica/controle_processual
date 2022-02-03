import 'package:controle_processual/domain/model/processo.dart';
import 'package:controle_processual/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class RowDataTable {
  final ValueSetter<dynamic> onTapItem;
  BuildContext context;

  RowDataTable({required this.onTapItem, required this.context});

  List<DataCell> mount({required Processo data, required List<dynamic> list}) {
    List<DataCell> cells = [];

    if (list.any((element) => element.text == KCidade && element.checked)) {
      cells.add(_rowString(data.cidade ?? "", data));
    }
    if (list.any((element) => element.text == KNucleo && element.checked)) {
      cells.add(_rowString(data.nucleo ?? "", data));
    }
    if (list.any((element) => element.text == KDetalhamento && element.checked)) {
      cells.add(_rowString(data.detalhamentoTemaProcesso ?? "", data));
    }
    if (list.any((element) => element.text == KTipo && element.checked)) {
      cells.add(_rowString(data.tipo ?? "", data));
    }
    if (list.any((element) => element.text == KAcao && element.checked)) {
      cells.add(_rowString(data.acao ?? "", data));
    }
    if (list.any((element) => element.text == KInicioPrevito && element.checked)) {
      cells.add(_rowData(data.inicioPrevisto ?? null, data));
    }
    if (list.any((element) => element.text == KTerminoPrevisto && element.checked)) {
      cells.add(_rowData(data.terminoPrevisto ?? null, data));
    }
    if (list.any((element) => element.text == KTerminoReal && element.checked)) {
      cells.add(_rowData(data.terminoReal ?? null, data));
    }
    if (list.any((element) => element.text == KPrazoEntrega && element.checked)) {
      cells.add(_rowString(data.prazoEntrega ?? "", data));
    }
    if (list.any((element) => element.text == KStatus && element.checked)) {
      cells.add(_rowString(data.status ?? "", data));
    }
    if (list.any((element) => element.text == KObservacao && element.checked)) {
      cells.add(_rowString(data.observacao ?? "", data));
    }
    if (list.any((element) => element.text == KResponsavel && element.checked)) {
      cells.add(_rowString(data.responsavelAtualizacao ?? "", data));
    }
    if (list.any((element) => element.text == KultimaAtualizacao && element.checked)) {
      cells.add(_rowData(data.ultimaAtualizacao ?? null, data));
    }

    return cells;
  }

  DataCell _rowString(String text, Processo data) {
    return DataCell(
      Text(
        '${text}',
        style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10),
      ),
      onTap: () => onTapItem(data),
    );
  }

  DataCell _rowData(DateTime? date, Processo data) {
    var text = '';
    if (date != null) {
      text = '${DateFormat('dd/MM/yyyy kk:mm').format(date as DateTime)}';
    }
    return DataCell(
      Text(
        text,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10),
      ),
      onTap: () => onTapItem(data),
    );
  }
}
