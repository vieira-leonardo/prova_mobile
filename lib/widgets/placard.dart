import 'package:flutter/material.dart';

class Placard extends StatelessWidget {
  final int placarJogador;
  final int placarComputador;

  Placard({required this.placarJogador, required this.placarComputador});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Placar', style: TextStyle(fontSize: 14)),
        SizedBox(height: 14),
        Container(
          width: 250,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 150, 147, 147),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Você: $placarJogador', style: TextStyle(fontSize: 20)),
              Text('PC: $placarComputador', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ],
    );
  }
}
