import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/service/models/EpisodeModel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../globalfuncs/Desigh.dart';

class WebtoonPageButton extends StatelessWidget {
  final String description;
  final Color buttonColor;
  final EpisodeModel episode;
  final String webtoonId;
  bool isDirectionLeft;

  onPressButton() async {
    final url = Uri.parse(
        'https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${isDirectionLeft ? episode.episodeId : 1}');
    await launchUrl(url);
  }

  WebtoonPageButton({
    super.key,
    required this.description,
    required this.buttonColor,
    this.isDirectionLeft = true,
    required this.episode,
    required this.webtoonId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressButton,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(.6),
              fontSize: 12,
            ),
          ),
          Container(
            width: 180 * scaleWidth(context),
            height: 50 * scaleHeightExceptMeunbar(context),
            decoration: BoxDecoration(
                color: buttonColor.withOpacity(.5),
                borderRadius: isDirectionLeft
                    ? const BorderRadius.horizontal(
                        left: Radius.circular(45),
                      )
                    : const BorderRadius.horizontal(
                        right: Radius.circular(45),
                      ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(5, 5),
                      blurRadius: 2,
                      color: Colors.black.withOpacity(.3))
                ]),
            child: Center(
                child: AutoSizeText(
              isDirectionLeft ? episode.title : '처음부터 정주행 하기',
              minFontSize: 8,
              maxFontSize: 12,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
