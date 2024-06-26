import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';
import 'package:toonflix/screens/CommentScreen.dart';
import 'package:toonflix/service/models/CountsModel.dart';
import 'package:toonflix/widgets/webtoon/Genre.dart';
import 'package:toonflix/widgets/webtoon/WebtoonPageFrameLezhin.dart';

import '../globalfuncs/System.dart';
import '../widgets/global/GlobalAppBar.dart';
import '../widgets/webtoon/WebtoonPageFrame.dart';

class WebtoonDetail extends StatefulWidget {
  CountsModel counts;

  final bool enableCommentField;
  final Future<CountsModel> Function() updateWebtoon;
  final Future<void> Function(bool) updateLikedWebtoon;
  final String identifier;
  final Color identifierColor;
  final List<String> genres;
  final String thumb;
  final String title;
  final String webtoonId;
  final String userIdentifier;
  int otherIdentifierCode;
  bool isBestWebtoon;
  bool isLiked;

  WebtoonDetail({
    super.key,
    required this.identifier,
    required this.genres,
    required this.thumb,
    required this.title,
    required this.identifierColor,
    required this.webtoonId,
    required this.counts,
    required this.updateWebtoon,
    required this.isLiked,
    required this.updateLikedWebtoon,
    required this.userIdentifier,
    required this.enableCommentField,
    this.isBestWebtoon = false,
    this.otherIdentifierCode = 0,
  });

  @override
  State<WebtoonDetail> createState() => _WebtoonDetailState();
}

class _WebtoonDetailState extends State<WebtoonDetail> {
  Future<void> updateWithDetail() async {
    widget.counts = await widget.updateWebtoon();
    setState(() {});
  }

  Future<void> updateLikedWithDetail() async {
    if (widget.userIdentifier != 'guest') {
      widget.isLiked = !widget.isLiked;
      await widget.updateLikedWebtoon(widget.isLiked);
      await updateWithDetail();
    } else {
      await alertMessage('추천 기능은 로그인 이후에 사용이 가능합니다.', context, false);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              widget.thumb,
              headers: const {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
          ),
        ),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.isBestWebtoon
                    ? 'best${widget.webtoonId}${widget.otherIdentifierCode}'
                    : widget.webtoonId,
                child: SizedBox(
                  height: 350 * scaleHeightExceptMeunbar(context),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      widget.thumb,
                      headers: const {
                        "User-Agent":
                            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 125 * scaleHeightExceptMeunbar(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Icon(widget.isLiked
                                        ? Icons.thumb_up_alt
                                        : Icons.thumb_up_off_alt),
                                    onTap: () => updateLikedWithDetail(),
                                  ),
                                  Text(
                                    '+ ${widget.counts.likecount > 999 ? 999 : widget.counts.likecount}',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                '이만큼 추천해요!',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.6),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    child: const Icon(Icons.message),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return CommentScreen(
                                            refreshWithDetail: updateWithDetail,
                                            enableCommentField:
                                                widget.enableCommentField,
                                            webtoonId: widget.webtoonId,
                                            counts: widget.counts,
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                  Text(
                                    '+ ${widget.counts.commentcount > 999 ? 999 : widget.counts.commentcount}',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                '의견 남기기',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.6),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.identifier.toUpperCase(),
                                style: TextStyle(
                                    color: widget.identifierColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                                textAlign: TextAlign.center,
                              ),
                              const Text(
                                '웹툰',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              for (var genre in widget.genres)
                                Genre(
                                  genreTitle: genre,
                                ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              widget.identifier == 'lezhin'
                  ? WebtoonPageFrameLezhin(
                      webtoonId: widget.webtoonId,
                      buttonColor: const Color(0xFFE21221),
                      title: widget.title,
                    )
                  : WebtoonPageFrame(
                      webtoonId: widget.webtoonId,
                    ),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: GlobalAppBar(
          centerTitle: true,
          titleText: widget.title,
          refreshCallback: updateWithDetail,
          showRefreshButtion: true,
        ),
      ),
    );
  }
}
