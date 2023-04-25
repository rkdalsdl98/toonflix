import 'package:flutter/material.dart';

import '../../globalfuncs/Desigh.dart';
import 'InputField.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({super.key});

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  bool isUnderstand = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SizedBox(
              width: 480 * scaleWidth(context),
              height: 50 * scaleHeightExceptMeunbar(context),
              child: const Text(
                '회원가입',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            width: 450 * scaleWidth(context),
            height: 480 * scaleHeightExceptMeunbar(context),
            decoration:
                BoxDecoration(color: const Color(0xFF221F1F).withOpacity(.6)),
            child: Column(
              children: [
                const InputField(
                  labelText: '아이디',
                  hintText: '아이디를 입력해주세요.',
                ),
                const InputField(
                  labelText: '비밀번호',
                  hintText: '비밀번호를 입력해주세요.',
                ),
                const InputField(
                  labelText: '비밀번호 확인',
                  hintText: '비밀번호 확인을 위해 한번 더 입력해주세요.',
                ),
                const InputField(
                  labelText: '닉네임',
                  hintText: '사용 하실 닉네임을 적어 주세요.',
                ),
                const InputField(
                  labelText: '생일',
                  hintText: '생일을 입력해주세요. 예) 2023-04-24',
                ),
                SizedBox(
                  width: 400 * scaleWidth(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      '본인은 귀사에 이력서를 제출함에 따라 [개인정보 보호법] 제15조 및 제17조에 따라 아래의 내용으로 개인정보를 수집, 이용 및 제공하는데 동의합니다.\n□ 개인정보의 수집 및 이용에 관한 사항\n- 수집하는 개인정보 항목 (이력서 양식 내용 일체) : 성명, 주민등록번호, 전화번호,\n주소, 이메일, 가족관계, 학력사항, 경력사항, 자격사항 등과 그 外 이력서 기재 내용 일체\n- 개인정보의 이용 목적 : 수집된 개인정보를 사업장 신규 채용 서류 심사 및 인사서류로 활용하며, 목적 외의 용도로는 사용하지 않습니다.\n□ 개인정보의 보관 및 이용 기간\n- 귀하의 개인정보를 다음과 같이 보관하며, 수집, 이용 및 제공목적이 달성된 경우\n[개인정보 보호법] 제21조에 따라 처리합니다.',
                      style: TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: isUnderstand,
                        onChanged: (state) {
                          setState(() {
                            isUnderstand = state!;
                          });
                        }),
                    Text(
                      '상기 내용을 모두 확인, 숙지 했으며 이에 모두 동의 합니다.',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white.withOpacity(.6),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    )
                  ],
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
                    '회원가입',
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
