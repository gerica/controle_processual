import 'package:cloud_firestore/cloud_firestore.dart';

class Processo {
  String? id;
  String? cidade;
  String? nucleo;
  String? detalhamentoTemaProcesso;
  String? tipo;
  String? acao;
  String? prazoEntrega;
  String? status;
  String? observacao;
  String? responsavelAtualizacao;
  DateTime? inicioPrevisto;
  DateTime? terminoPrevisto;
  DateTime? terminoReal;
  DateTime? ultimaAtualizacao;

  Processo.empty();

  Processo(
      {required this.cidade,
      required this.nucleo,
      required this.detalhamentoTemaProcesso,
      required this.tipo,
      required this.acao,
      required this.prazoEntrega,
      required this.status,
      required this.observacao,
      required this.responsavelAtualizacao,
      required this.inicioPrevisto,
      required this.terminoPrevisto,
      required this.terminoReal,
      required this.ultimaAtualizacao,
      this.id});

  Processo.fromJson(Map<String, dynamic> parsedJson, String idDoc) {
    id = idDoc;
    cidade = parsedJson['cidade'] as String;
    nucleo = parsedJson['nucleo'] as String;
    detalhamentoTemaProcesso = parsedJson['detalhamentoTemaProcesso'] as String;
    tipo = parsedJson['tipo'] as String;
    acao = parsedJson['acao'] as String;
    prazoEntrega = parsedJson['prazoEntrega'] as String;
    status = parsedJson['status'] as String;
    observacao = parsedJson['observacao'] as String;
    responsavelAtualizacao = parsedJson['responsavelAtualizacao'] as String;
    final tempInicioPrevisto = parsedJson['inicioPrevisto'];
    if (tempInicioPrevisto != null) {
      inicioPrevisto = (tempInicioPrevisto as Timestamp).toDate();
    }
    final tempTerminoPrevisto = parsedJson['terminoPrevisto'];
    if (tempTerminoPrevisto != null) {
      terminoPrevisto = (tempTerminoPrevisto as Timestamp).toDate();
    }
    final tempTerminoReal = parsedJson['terminoReal'];
    if (tempTerminoReal != null) {
      terminoReal = (tempTerminoReal as Timestamp).toDate();
    }
    final tempUltimaAtualizacao = parsedJson['ultimaAtualizacao'];
    if (tempUltimaAtualizacao != null) {
      ultimaAtualizacao = (tempUltimaAtualizacao as Timestamp).toDate();
    }
  }

  @override
  String toString() {
    return 'Processo{cidade: $cidade, nucleo: $nucleo, detalhamentoTemaProcesso: $detalhamentoTemaProcesso, tipo: $tipo, acao: $acao, prazoEntrega: $prazoEntrega, status: $status, observacao: $observacao, responsavelAtualizacao: $responsavelAtualizacao, inicioPrevisto: $inicioPrevisto, terminoPrevisto: $terminoPrevisto, terminoReal: $terminoReal, ultimaAtualizacao: $ultimaAtualizacao}';
  }

  Map<String, dynamic> toJson() => {
        'cidade': cidade,
        'nucleo': nucleo,
        'detalhamentoTemaProcesso': detalhamentoTemaProcesso,
        'tipo': tipo,
        'acao': acao,
        'prazoEntrega': prazoEntrega,
        'status': status,
        'observacao': observacao,
        'responsavelAtualizacao': responsavelAtualizacao,
        'inicioPrevisto': inicioPrevisto,
        'terminoPrevisto': terminoPrevisto,
        'terminoReal': terminoReal,
        'ultimaAtualizacao': ultimaAtualizacao,
      };
}
