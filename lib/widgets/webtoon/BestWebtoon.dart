import 'package:flutter/material.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';
import 'package:toonflix/widgets/webtoon/Genre.dart';

import '../../globalfuncs/Desigh.dart';

class BestWebtoon extends StatelessWidget {
  final WebtoonModel webtoon;

  const BestWebtoon({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520 * scaleHeight(context),
      child: Stack(
        children: [
          Positioned(
            child: Image.network(
              webtoon.thumb,
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 480 * scaleHeight(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                for (var genre in webtoon.company == 'lezhin'
                    ? webtoon.genre.split('.')
                    : webtoon.genre.split(','))
                  Genre(genreTitle: genre)
              ],
            ),
          ),
          Positioned(
            left: 15 * scaleWidth(context),
            right: 0,
            child: RichText(
              text: TextSpan(
                text: webtoon.company.toUpperCase(),
                style: TextStyle(
                  color: identifierColor[webtoon.company],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                children: const [
                  TextSpan(
                    text: ' 웹툰',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
