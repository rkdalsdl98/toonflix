import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/System.dart';
import 'package:toonflix/service/UserService.dart';

import '../../globalfuncs/Desigh.dart';
import 'InputField.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({super.key});

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  bool isUnderstand = false;
  bool isDuplicatedId = true;

  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passCheckController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController birthController = TextEditingController();

  checkIsDuplicated() async {
    try {
      if (idController.text.isEmpty) {
        await alertMessage('아이디를 입력해 주세요.', context, false);
      }
      final result = await UserService.checkDuplicatedId(idController.text);
      if (!result && context.mounted) {
        await alertMessageYesOrNo('사용 가능한 아이디 입니다.\n사용 하시겠습니까?', context,
            (state) {
          isDuplicatedId = !state;
        });
      } else {
        await alertMessage('중복된 아이디 입니다.', context, false);
      }
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  regist() async {
    if (isDuplicatedId == false) {
      if (passController.text == passCheckController.text) {
        if (nicknameController.text.length <= 10) {
          final isValidBirth = UserService.checkBirthForm(birthController.text);
          if (isValidBirth) {
            if (isUnderstand == true) {
              Map<String, dynamic> user = {
                "name": idController.text,
                "pass": passController.text,
                "nickname": nicknameController.text,
                "birth": birthController.text
              };

              final res = await UserService.register(user);
              if (res && context.mounted) {
                await alertMessage(
                    '아이디를 성공적으로 생성하셨습니다!\n(홈 화면으로 돌아갑니다.)', context, true);
              } else {
                await alertMessage(
                    '서버에 문제가 생겨 아이디를 생성하는데 실패했습니다.', context, false);
              }
            } else {
              await alertMessage('개인정보 수집에 동의 해주세요.', context, false);
            }
          } else {
            await alertMessage('생일을 형식에 맞게 작성 해주세요.', context, false);
          }
        } else {
          await alertMessage('닉네임은 10글자 이내로 작성해주세요.', context, false);
        }
      } else {
        await alertMessage('비밀번호를 확인해주세요.', context, false);
      }
    } else {
      await alertMessage('아이디를 확인해 주세요.', context, false);
    }
  }

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
            height: 495 * scaleHeightExceptMeunbar(context),
            decoration:
                BoxDecoration(color: const Color(0xFF221F1F).withOpacity(.6)),
            child: Column(
              children: [
                InputField(
                  labelText: '아이디',
                  hintText: '아이디를 입력해주세요.',
                  controller: idController,
                  enabled: isDuplicatedId,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFE21221).withOpacity(.6)),
                        width: 50 * scaleWidth(context),
                        height: 15 * scaleHeightExceptMeunbar(context),
                        child: isDuplicatedId
                            ? GestureDetector(
                                onTap: checkIsDuplicated,
                                child: const AutoSizeText(
                                  '중복확인',
                                  minFontSize: 7,
                                  maxFontSize: 9,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            : const Icon(
                                Icons.check_rounded,
                                size: 15,
                                color: Colors.green,
                              ),
                      ),
                    )
                  ],
                ),
                InputField(
                  labelText: '비밀번호',
                  hintText: '비밀번호를 입력해주세요.',
                  controller: passController,
                  obscureText: true,
                ),
                InputField(
                  labelText: '비밀번호 확인',
                  hintText: '비밀번호 확인을 위해 한번 더 입력해주세요.',
                  controller: passCheckController,
                  obscureText: true,
                ),
                InputField(
                  labelText: '닉네임',
                  hintText: '사용 하실 닉네임을 적어 주세요.',
                  controller: nicknameController,
                ),
                InputField(
                  labelText: '생일',
                  hintText: '생일을 입력해주세요. 예) 2023-04-24',
                  controller: birthController,
                ),
                SizedBox(
                  width: 400 * scaleWidth(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: AutoSizeText(
                      '본인은 귀사에 이력서를 제출함에 따라 [개인정보 보호법] 제15조 및 제17조에 따라 아래의 내용으로 개인정보를 수집, 이용 및 제공하는데 동의합니다.\n□ 개인정보의 수집 및 이용에 관한 사항\n- 수집하는 개인정보 항목 (이력서 양식 내용 일체) : 성명, 주민등록번호, 전화번호,\n주소, 이메일, 가족관계, 학력사항, 경력사항, 자격사항 등과 그 外 이력서 기재 내용 일체\n- 개인정보의 이용 목적 : 수집된 개인정보를 사업장 신규 채용 서류 심사 및 인사서류로 활용하며, 목적 외의 용도로는 사용하지 않습니다.\n□ 개인정보의 보관 및 이용 기간\n- 귀하의 개인정보를 다음과 같이 보관하며, 수집, 이용 및 제공목적이 달성된 경우\n[개인정보 보호법] 제21조에 따라 처리합니다.',
                      minFontSize: 5,
                      maxFontSize: 7,
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
                    AutoSizeText(
                      '상기 내용을 모두 확인, 숙지 했으며 이에 모두 동의 합니다.',
                      minFontSize: 8,
                      maxFontSize: 10,
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
              onTap: () => regist(),
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
