import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../globalfuncs/Desigh.dart';

class Genre extends StatelessWidget {
  final String genreTitle;

  const Genre({
    super.key,
    required this.genreTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      child: Container(
        width: 70 * scaleWidth(context),
        height: 25 * scaleHeightExceptMeunbar(context),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            )),
        child: Center(
          child: AutoSizeText(
            '#$genreTitle',
            style: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 10,
                fontWeight: FontWeight.w600),
            maxFontSize: 10,
            minFontSize: 6,
          ),
        ),
      ),
    );
  }
}
