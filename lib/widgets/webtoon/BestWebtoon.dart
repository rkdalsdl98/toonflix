import 'package:flutter/material.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';
import 'package:toonflix/widgets/webtoon/Genre.dart';
import 'package:toonflix/widgets/webtoon/Webtoon.dart';

import '../../globalfuncs/Desigh.dart';

class BestWebtoon extends StatelessWidget {
  final WebtoonModel webtoon;
  final String identifier;

  const BestWebtoon({
    super.key,
    required this.webtoon,
    required this.identifier,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520 * scaleHeight(context),
      child: GestureDetector(
        child: Stack(
          children: [
            Positioned(
              width: 360,
              height: 520,
              left: MediaQuery.of(context).size.width - 385,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      blurRadius: 5,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Webtoon(
                  webtoon: webtoon,
                  identifier: identifier,
                  isBestWebtoon: true,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 30,
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
              left: 50 * scaleWidth(context),
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
      ),
    );
  }
}
