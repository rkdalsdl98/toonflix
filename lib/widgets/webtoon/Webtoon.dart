import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';

import '../../globalfuncs/Desigh.dart';
import '../../screens/WebtoonDetail.dart';

final Map<String, Color> identifierColor = {
  'naver': const Color(0xFF00FF00),
  'kakao': Colors.yellow,
  'lezhin': Colors.red,
};

class Webtoon extends StatefulWidget {
  final WebtoonModel webtoon;

  const Webtoon({
    super.key,
    required this.webtoon,
  });

  @override
  State<Webtoon> createState() => _WebtoonState();
}

class _WebtoonState extends State<Webtoon> {
  late List<String> genres;

  @override
  void initState() {
    super.initState();
    genres = widget.webtoon.genre.split(',');

    if (genres.length > 3) genres.length = 3;
  }

  @override
  Widget build(BuildContext context) {
    onViewDetail() {
      return Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return WebtoonDetail(
            likeCount: widget.webtoon.likecount,
            genres: genres,
            identifier: widget.webtoon.company,
            thumb: widget.webtoon.thumb,
            title: widget.webtoon.title,
            identifierColor: identifierColor[widget.webtoon.company]!,
            webtoonId: widget.webtoon.webtoonid,
          );
        },
      ));
    }

    return GestureDetector(
      onTap: onViewDetail,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Container(
          height: 180 * scaleWidth(context),
          width: 108 * scaleWidth(context),
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              Hero(
                tag: widget.webtoon.webtoonid,
                child: Image.network(
                  widget.webtoon.thumb,
                  headers: const {
                    "User-Agent":
                        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                  },
                ),
              ),
              AutoSizeText(
                widget.webtoon.company.toUpperCase(),
                minFontSize: 10,
                maxFontSize: 12,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: identifierColor[widget.webtoon.company],
                ),
              ),
              AutoSizeText(
                widget.webtoon.title,
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
      ),
    );
  }
}
