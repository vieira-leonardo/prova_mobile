import 'dart:math';
import '../models/jogada.dart';

Jogada gerarJogadaComputador() {
  final random = Random();
  return Jogada.values[random.nextInt(3)];
}

String obterResultado(Jogada jogadaJogador, Jogada jogadaComputador) {
  if (jogadaJogador == jogadaComputador) {
    return 'Empate';
  } else if ((jogadaJogador == Jogada.pedra && jogadaComputador == Jogada.tesoura) ||
      (jogadaJogador == Jogada.papel && jogadaComputador == Jogada.pedra) ||
      (jogadaJogador == Jogada.tesoura && jogadaComputador == Jogada.papel)) {
    return 'Você Ganhou';
  } else {
    return 'Computador Ganhou';
  }
}
