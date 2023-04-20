import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../globalfuncs/Desigh.dart';

class Webtoon extends StatelessWidget {
  final String identifier;
  final Color identifierColor;
  final String title;
  final String thumb;

  const Webtoon({
    super.key,
    required this.identifier,
    required this.identifierColor,
    required this.title,
    required this.thumb,
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
            Image.network(
              thumb,
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
            ),
            AutoSizeText(
              identifier.toUpperCase(),
              minFontSize: 10,
              maxFontSize: 12,
              maxLines: 1,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: identifierColor,
              ),
            ),
            AutoSizeText(
              title,
              maxLines: 2,
              minFontSize: 7,
              maxFontSize: 10,
              style: const TextStyle(
                fontSize: 7,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
