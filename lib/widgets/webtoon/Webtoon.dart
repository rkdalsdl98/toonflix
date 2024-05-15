import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/service/controllers/user_controller.dart';
import 'package:toonflix/service/models/CountsModel.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';

import '../../globalfuncs/Desigh.dart';
import '../../screens/WebtoonDetail.dart';
import '../../service/ApiService.dart';
import '../../service/UserService.dart';

class Webtoon extends StatefulWidget {
  final WebtoonModel webtoon;
  final String identifier;
  double borderIntensity;
  int otherIdentifierCode;
  bool isBestWebtoon;

  Webtoon({
    super.key,
    required this.webtoon,
    required this.identifier,
    this.isBestWebtoon = false,
    this.otherIdentifierCode = 0,
    this.borderIntensity = 0,
  });

  @override
  State<Webtoon> createState() => _WebtoonState();
}

class _WebtoonState extends State<Webtoon> {
  late List<String> genres;
  late CountsModel counts;
  bool enableCommentField = false;
  bool isLiked = false;

  Future<void> refresh() async {
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
    await updateWebtoon();
  }

  Future<CountsModel> updateWebtoon() async {
    counts = await ApiService.getWebtoonCounts(widget.webtoon.webtoonid);
    return counts;
  }

  Future<void> updateLikedWebtoon(bool isLikedByDetail) async {
    if (widget.identifier != 'guest') {
      await UserService.updateLikeWebtoon(
        !isLikedByDetail,
        widget.webtoon.title,
        widget.webtoon.webtoonid,
      );

      if (isLikedByDetail) {
        ++counts.likecount;
        Get.find<UserController>().addLikeWebtoon(widget.webtoon);
      } else {
        --counts.likecount;
        Get.find<UserController>().deleteLikeWebtoon(widget.webtoon);
      }
      isLiked = isLikedByDetail;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    onViewDetail() {
      refresh();
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
            isBestWebtoon: widget.isBestWebtoon,
            otherIdentifierCode: widget.otherIdentifierCode,
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
        child: SizedBox(
          height: 180 * scaleWidth(context),
          width: 108 * scaleWidth(context),
          child: Column(
            children: [
              Hero(
                tag: widget.isBestWebtoon
                    ? 'best${widget.webtoon.webtoonid}${widget.otherIdentifierCode}'
                    : widget.webtoon.webtoonid,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderIntensity),
                  ),
                  child: Image.network(
                    widget.webtoon.thumb,
                    fit: BoxFit.cover,
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    },
                  ),
                ),
              ),
              if (!widget.isBestWebtoon)
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
              if (!widget.isBestWebtoon)
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
