import 'package:flutter/material.dart';
import 'package:toonflix/screens/LoginScreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: 'assets/config/.env');
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
