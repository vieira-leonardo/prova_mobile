import 'package:flutter/material.dart';
import '../widgets/jogada_button.dart';
import '../widgets/placard.dart';
import '../models/jogada.dart';
import '../utils/jogada_utils.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int placarJogador = 0;
  int placarComputador = 0;
  String resultadoRodada = '';
  Jogada? jogadaComputador;

  void jogar(Jogada jogadaJogador) {
    jogadaComputador = gerarJogadaComputador();
    String resultado = obterResultado(jogadaJogador, jogadaComputador!);

    if (resultado == 'Você Ganhou') {
      placarJogador++;
    } else if (resultado == 'Computador Ganhou') {
      placarComputador++;
    }

    setState(() {
      resultadoRodada = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sua jogada:', style: TextStyle(fontSize: 14)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              JogadaButton(jogada: Jogada.pedra, onPressed: () => jogar(Jogada.pedra)),
              JogadaButton(jogada: Jogada.papel, onPressed: () => jogar(Jogada.papel)),
              JogadaButton(jogada: Jogada.tesoura, onPressed: () => jogar(Jogada.tesoura)),
            ],
          ),
          SizedBox(height: 40),
          Text('Jogada do Computador:', style: TextStyle(fontSize: 14)),
          if (jogadaComputador != null) 
            buildCircleIcon(jogadaComputador!),
          SizedBox(height: 20),
          Text(resultadoRodada, style: TextStyle(fontSize: 14)),
          SizedBox(height: 40),
          Placard(placarJogador: placarJogador, placarComputador: placarComputador),
        ],
      ),
    );
  }

  Widget buildCircleIcon(Jogada jogada) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200,
      ),
      child: Center(child: getIcon(jogada)),
    );
  }

  Widget getIcon(Jogada jogada) {
    switch (jogada) {
      case Jogada.pedra:
        return Icon(Icons.circle, size: 50);
      case Jogada.papel:
        return Icon(Icons.description, size: 50);
      case Jogada.tesoura:
        return Icon(Icons.content_cut, size: 50);
    }
  }
}
