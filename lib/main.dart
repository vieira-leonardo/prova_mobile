import 'package:flutter/material.dart';
import 'screens/game_screen.dart';

void main() {
  runApp(PedraPapelTesouraApp());
}

class PedraPapelTesouraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedra Papel Tesoura',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameScreen(),
    );
  }
}
