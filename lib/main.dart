import 'package:flutter/material.dart';
import 'package:toonflix/screens/LoginScreen.dart';

void main() {
  runApp(const ToonFlix());
}

class ToonFlix extends StatelessWidget {
  const ToonFlix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      title: 'ToonFlix',
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark(
          background: Color(0xFF221F1F),
        ),
      ),
    );
  }
}
