import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../globalfuncs/Desigh.dart';

class WebtoonPageFrameLezhin extends StatefulWidget {
  final String webtoonId;
  final String title;
  final Color buttonColor;
  final bool hiddenText;

  const WebtoonPageFrameLezhin({
    super.key,
    required this.webtoonId,
    required this.buttonColor,
    required this.title,
    this.hiddenText = false,
  });

  @override
  State<WebtoonPageFrameLezhin> createState() => _WebtoonPageFrameLezhinState();
}

class _WebtoonPageFrameLezhinState extends State<WebtoonPageFrameLezhin> {
  onPressButton() async {
    final url =
        Uri.parse('https://www.lezhin.com/ko/comic/${widget.webtoonId}/p1');
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125 * scaleHeightExceptMeunbar(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: widget.hiddenText
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            if (!widget.hiddenText)
              AutoSizeText(
                '레진 코믹스 웹툰은 플랫폼 특성상 프롤로그 페이지로만 이동하며,\n프롤로그가 없는 웹툰에 경우 해당 웹툰 페이지로 이동하게 됩니다.',
                minFontSize: 8,
                maxFontSize: 12,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(.6),
                ),
              ),
            if (!widget.hiddenText)
              SizedBox(
                height: 20 * scaleHeightExceptMeunbar(context),
              ),
            Container(
              width: 180 * scaleWidth(context),
              height: 50 * scaleHeightExceptMeunbar(context),
              decoration: BoxDecoration(
                  color: widget.buttonColor.withOpacity(.5),
                  borderRadius: const BorderRadius.all(Radius.circular(45)),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(5, 5),
                        blurRadius: 2,
                        color: Colors.black.withOpacity(.3))
                  ]),
              child: GestureDetector(
                onTap: onPressButton,
                child: Center(
                  child: AutoSizeText(
                    '${widget.title}\n보러가기',
                    minFontSize: 8,
                    maxFontSize: 12,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
