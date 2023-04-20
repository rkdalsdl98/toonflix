import 'package:flutter/material.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';

import 'Webtoon.dart';

final Map<String, Color> identifierColor = {
  'naver': Colors.green,
  'kakao': Colors.yellow,
  'lezhin': Colors.red,
};

class WebtoonColum extends StatefulWidget {
  final List<WebtoonModel> webtoonColum;

  const WebtoonColum({
    super.key,
    required this.webtoonColum,
  });

  @override
  State<WebtoonColum> createState() => _WebtoonColumState();
}

class _WebtoonColumState extends State<WebtoonColum> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var webtoon in widget.webtoonColum)
              Webtoon(
                identifier: webtoon.company,
                identifierColor: identifierColor[webtoon.company]!,
                title: webtoon.title,
                thumb: webtoon.thumb,
              )
          ],
        ),
      ],
    );
  }
}
