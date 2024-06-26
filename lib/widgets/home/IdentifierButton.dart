import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class IdentifierButton extends StatelessWidget {
  final String identifier;
  final Function(String) callChangeCategory;

  const IdentifierButton({
    super.key,
    required this.identifier,
    required this.callChangeCategory,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => callChangeCategory(identifier),
        child: AutoSizeText(
          identifier.toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ));
  }
}
