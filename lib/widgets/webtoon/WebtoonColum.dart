import 'package:flutter/material.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';

import 'Webtoon.dart';

class WebtoonColum extends StatefulWidget {
  final List<WebtoonModel> webtoonColum;
  final String identifier;

  const WebtoonColum(
      {super.key, required this.webtoonColum, required this.identifier});

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
                webtoon: webtoon,
                identifier: widget.identifier,
                borderIntensity: 45,
              )
          ],
        ),
      ],
    );
  }
}
