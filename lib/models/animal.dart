class Animal {
  final String id; // Adicione esta linha
  final String nomeTutor;
  final String contatoTutor;
  final String especie;
  final String raca;
  final DateTime dataEntrada;
  final int diarias;
  final DateTime previsaoSaida;
  final int diariasTotais;

  Animal({
    required this.id,
    required this.nomeTutor,
    required this.contatoTutor,
    required this.especie,
    required this.raca,
    required this.dataEntrada,
    required this.diarias,
    required this.previsaoSaida,
    required this.diariasTotais,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Animal && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
