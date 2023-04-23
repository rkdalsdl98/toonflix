import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';
import 'package:toonflix/widgets/webtoon/Genre.dart';

import '../widgets/global/GlobalAppBar.dart';
import '../widgets/webtoon/WebtoonPageFrame.dart';

class WebtoonDetail extends StatelessWidget {
  final int likeCount;
  final String identifier;
  final Color identifierColor;
  final List<String> genres;
  final String thumb;
  final String title;
  final String webtoonId;

  const WebtoonDetail({
    super.key,
    required this.likeCount,
    required this.identifier,
    required this.genres,
    required this.thumb,
    required this.title,
    required this.identifierColor,
    required this.webtoonId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              thumb,
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
                tag: webtoonId,
                child: SizedBox(
                  height: 350 * scaleHeightExceptMeunbar(context),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      thumb,
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
                                  const Icon(Icons.thumb_up_off_alt),
                                  Text(
                                    '+ $likeCount',
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
                                children: const [
                                  Icon(Icons.message),
                                  Text(
                                    '+ 999',
                                    style: TextStyle(
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
                                identifier.toUpperCase(),
                                style: TextStyle(
                                    color: identifierColor,
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
                              for (var genre in genres)
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
              WebtoonPageFrame(
                webtoonId: webtoonId,
              ),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: GlobalAppBar(
          centerTitle: true,
          titleText: title,
        ),
      ),
    );
  }
}
