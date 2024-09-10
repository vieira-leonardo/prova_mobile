import 'package:flutter/material.dart';
import '../models/jogada.dart';

class JogadaButton extends StatelessWidget {
  final Jogada jogada;
  final VoidCallback onPressed;

  JogadaButton({required this.jogada, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Column(
        children: [
          buildCircleIcon(jogada),
          SizedBox(height: 10),
          Text(jogada.toString().split('.').last.toUpperCase()),
        ],
      ),
    );
  }

  Widget buildCircleIcon(Jogada jogada) {
    return Container(
      width: 40,
      height: 40,
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
        return Icon(Icons.circle, size: 40);
      case Jogada.papel:
        return Icon(Icons.description, size: 40);
      case Jogada.tesoura:
        return Icon(Icons.content_cut, size: 40);
    }
  }
}
