import 'package:flutter/cupertino.dart';
import 'package:toonflix/service/ApiService.dart';

import 'Webtoon.dart';

class WebtoonList extends StatefulWidget {
  const WebtoonList({
    super.key,
  });

  @override
  State<WebtoonList> createState() => _WebtoonListState();
}

class _WebtoonListState extends State<WebtoonList> {
  @override
  void initState() {
    super.initState();
    ApiService.getTodaysToons();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Webtoon(
                identifier: 'naver',
                identifierColor: const Color(0xFF00DC64),
                title: '화산귀환'),
          ],
        ),
      ],
    );
  }
}
