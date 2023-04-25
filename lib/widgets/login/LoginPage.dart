import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SizedBox(
              width: 480 * scaleWidth(context),
              height: 70 * scaleHeightExceptMeunbar(context),
              child: const Text(
                '로그인',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            width: 400 * scaleWidth(context),
            height: 250 * scaleHeightExceptMeunbar(context),
            decoration:
                BoxDecoration(color: const Color(0xFF221F1F).withOpacity(.6)),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      labelText: '아이디를 입력해주세요.',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      labelText: '비밀번호를 입력해주세요.',
                    ),
                  ),
                ),
                SizedBox(
                  width: 400 * scaleWidth(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Text(
                      '아이디를 잊어버렸나요?',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400 * scaleWidth(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      '아직 ToonFlix 회원이 아니신가요?\n회원가입을 하면 다양한 이벤트및 공지사항을 수신 받고 웹툰 투표에 참여 하실 수 있습니다!\n지금 바로 가입하고 투표권을 손에 쥐어 보세요!',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(.5)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              child: Container(
                width: 120 * scaleWidth(context),
                height: 40 * scaleHeight(context),
                decoration: BoxDecoration(
                  color: const Color(0xFFE21221).withOpacity(.6),
                ),
                child: const Center(
                  child: Text(
                    '로그인',
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
