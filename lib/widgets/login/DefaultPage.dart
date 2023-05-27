import 'package:flutter/material.dart';

import '../../globalfuncs/Desigh.dart';
import 'LoginButton.dart';
import 'LoginDescription.dart';

class DefaultPage extends StatelessWidget {
  final void Function(String) onChangePage;

  const DefaultPage({
    super.key,
    required this.onChangePage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: scaleHeightByDevice(context, 1 / 6),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '오늘은 뭘볼까?',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
              Text(
                '고민을 덜어주는 ToonFlix!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
        SizedBox(
          height: scaleHeightByDevice(context, 1 / 3),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginDescription(
                  description:
                      '다양한 플랫폼에 있는 오늘의 웹툰을 추천 해드립니다!\n또한 여러분들이 좋아요를 많이 누른 웹툰은 최상단에 위치하여\n다른 사용자에게 해당 웹툰을 추천할 수 있습니다!',
                  showTextDuration: 1000,
                ),
                LoginDescription(
                  description:
                      '항상 인기 있는 것만 상단에 뜨는건 이제 싫어!\n매일 매일 새로운 추천수를 종합하여 상단에 띄워 드립니다!\n회원가입 없이도 웹툰추천은 받을 수 있어요! ',
                  showTextDuration: 2000,
                )
              ],
            ),
          ),
        ),
        Container(
          width: 1080 * scaleWidth(context),
          decoration: const BoxDecoration(),
          height: scaleHeightByDevice(context, 1 / 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoginButton(
                bgColor: const Color(0xFFE21221).withOpacity(.6),
                buttonText: 'ToonFlix 아이디로 시작하기',
                identifier: 'login',
                showButtonDuration: 3000,
                onChangePage: onChangePage,
              ),
              LoginButton(
                bgColor: Colors.white.withOpacity(.7),
                buttonText: 'Guest로 입장하기',
                buttonTextColor: Colors.black,
                identifier: 'guest',
                showButtonDuration: 3200,
                onChangePage: onChangePage,
              ),
              LoginButton(
                bgColor: const Color(0xFF181616),
                buttonText: '회원가입',
                identifier: 'regist',
                showButtonDuration: 3400,
                onChangePage: onChangePage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
