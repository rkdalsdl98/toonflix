import 'package:flutter/material.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';

import '../../globalfuncs/Desigh.dart';

class LatestWebtoonColum extends StatelessWidget {
  final WebtoonModel? webtoon;

  const LatestWebtoonColum({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (webtoon != null)
          RichText(
            text: TextSpan(
              text: '${webtoon!.company.toUpperCase()} ',
              style: TextStyle(
                color: identifierColor[webtoon!.company],
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
              children: const [
                TextSpan(
                  text: '웹툰',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          height: 10 * scaleHeight(context),
        ),
        if (webtoon != null)
          Text(
            webtoon!.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }
}
