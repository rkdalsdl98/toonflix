
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../globalfuncs/Desigh.dart';

class Webtoon extends StatelessWidget {
  final String identifier;
  final Color identifierColor;
  final String title;
  String? thumb;

  Webtoon({
    super.key,
    required this.identifier,
    required this.identifierColor,
    required this.title,
    this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Container(
        height: 180 * scaleWidth(context),
        width: 108 * scaleWidth(context),
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/icons/화산귀환.jpg'),
            ),
            AutoSizeText(
              identifier.toUpperCase(),
              minFontSize: 8,
              maxFontSize: 12,
              maxLines: 1,
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w600,
                color: identifierColor,
              ),
            ),
            AutoSizeText(
              title,
              maxLines: 1,
              minFontSize: 12,
              maxFontSize: 14,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
