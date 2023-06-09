import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/service/models/CountsModel.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';

import '../../globalfuncs/Desigh.dart';
import '../../screens/WebtoonDetail.dart';
import '../../service/ApiService.dart';
import '../../service/UserService.dart';

final Map<String, Color> identifierColor = {
  'naver': const Color(0xFF00FF00),
  'kakao': Colors.yellow,
  'lezhin': Colors.red,
};

class Webtoon extends StatefulWidget {
  final WebtoonModel webtoon;
  final String identifier;

  const Webtoon({super.key, required this.webtoon, required this.identifier});

  @override
  State<Webtoon> createState() => _WebtoonState();
}

class _WebtoonState extends State<Webtoon> {
  late List<String> genres;
  late CountsModel counts;
  bool enableCommentField = false;
  bool isLiked = false;

  Future<void> init() async {
    if (widget.identifier != 'guest') {
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final likes = storage.getStringList('liked');

      isLiked = likes!.contains(widget.webtoon.title);
      enableCommentField = true;
    }

    genres = widget.webtoon.company == 'lezhin'
        ? widget.webtoon.genre.split('.')
        : widget.webtoon.genre.split(',');
    counts = CountsModel.fromJson({
      'likecount': widget.webtoon.likecount,
      'commentcount': widget.webtoon.commentcount
    });

    if (genres.length > 3) genres.length = 3;
  }

  Future<CountsModel> updateWebtoon() async {
    counts = await ApiService.getWebtoonCounts(widget.webtoon.webtoonid);
    setState(() {});
    return counts;
  }

  Future<void> updateLikedWebtoon(bool isLikedByDetail) async {
    if (widget.identifier != 'guest') {
      await UserService.updateLikeWebtoon(
          !isLikedByDetail, widget.webtoon.title, widget.webtoon.webtoonid);

      if (isLikedByDetail) {
        ++counts.likecount;
      } else {
        --counts.likecount;
      }
      isLiked = isLikedByDetail;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    onViewDetail() {
      return Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return WebtoonDetail(
            userIdentifier: widget.identifier,
            updateWebtoon: updateWebtoon,
            updateLikedWebtoon: updateLikedWebtoon,
            counts: counts,
            genres: genres,
            identifier: widget.webtoon.company,
            thumb: widget.webtoon.thumb,
            title: widget.webtoon.title,
            identifierColor: identifierColor[widget.webtoon.company]!,
            webtoonId: widget.webtoon.webtoonid,
            isLiked: isLiked,
            enableCommentField: enableCommentField,
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
                minFontSize: 8,
                maxFontSize: 12,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: identifierColor[widget.webtoon.company],
                ),
              ),
              AutoSizeText(
                widget.webtoon.title.length > 12
                    ? widget.webtoon.title.substring(0, 12).padRight(15, '.')
                    : widget.webtoon.title,
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
