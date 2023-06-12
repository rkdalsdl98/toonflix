import 'package:flutter/material.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';
import 'package:toonflix/widgets/webtoon/Webtoon.dart';

import '../../globalfuncs/Desigh.dart';

class LatestWebtoon extends StatelessWidget {
  final int position;
  double pageValue;
  double scaleFactor;
  Matrix4 matrix = Matrix4.identity();
  final double _height = 350;
  final WebtoonModel webtoon;
  final String identifier;

  LatestWebtoon({
    super.key,
    required this.position,
    required this.pageValue,
    required this.scaleFactor,
    required this.webtoon,
    required this.identifier,
  });

  @override
  Widget build(BuildContext context) {
    if (pageValue.floor() == position) {
      var currScale = 1 - (pageValue - position) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == pageValue.floor() + 1) {
      var currScale =
          scaleFactor + (pageValue - position + 1) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == pageValue.floor() - 1) {
      var currScale = 1 - (pageValue - position) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = .8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Container(
        margin: EdgeInsets.only(
          left: 20 * scaleWidth(context),
          right: 20 * scaleWidth(context),
        ),
        child: Webtoon(
          webtoon: webtoon,
          identifier: identifier,
          isBestWebtoon: true,
          otherIdentifierCode: 2,
          borderIntensity: 45,
        ),
      ),
    );
  }
}
