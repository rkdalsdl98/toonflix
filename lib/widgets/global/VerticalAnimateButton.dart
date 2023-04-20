
import 'package:flutter/material.dart';

class VerticalAnimateButton extends StatefulWidget {
  const VerticalAnimateButton({super.key});

  @override
  State<VerticalAnimateButton> createState() => _VerticalAnimateButtonState();
}

class _VerticalAnimateButtonState extends State<VerticalAnimateButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 500,
        ),
        child: const AnimatedOpacity(
          opacity: 1,
          duration: Duration(
            milliseconds: 500,
          ),
          child: Text('하잉'),
        ),
      ),
    );
  }
}
