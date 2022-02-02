class Processo {
  String cidade;
  String nucleo;
  String detalhamentoTemaProcesso;
  String tipo;
  String acao;
  String prazoEntrega;
  String status;
  String observacao;
  String responsavelAtualizacao;
  DateTime? inicioPrevisto;
  DateTime? terminoPrevisto;
  DateTime? terminoReal;
  DateTime? ultimaAtualizacao;

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
      required this.ultimaAtualizacao});

  @override
  String toString() {
    return 'Processo{cidade: $cidade, nucleo: $nucleo, detalhamentoTemaProcesso: $detalhamentoTemaProcesso, tipo: $tipo, acao: $acao, prazoEntrega: $prazoEntrega, status: $status, observacao: $observacao, responsavelAtualizacao: $responsavelAtualizacao, inicioPrevisto: $inicioPrevisto, terminoPrevisto: $terminoPrevisto, terminoReal: $terminoReal, ultimaAtualizacao: $ultimaAtualizacao}';
  }
}
