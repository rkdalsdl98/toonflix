import 'package:flutter/material.dart';

const double preferredAppBarHeight = 80;
const double preferredBottomMenubarHeight = 80;

Future<void> alertMessage(String message, BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      actions: [
        TextButton(
          child: const Text('예'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

Future<void> alertMessageYesOrNo(
    String message, BuildContext context, void Function(bool) callback) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        message,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      actions: [
        TextButton(
          child: const Text('예'),
          onPressed: () {
            Navigator.pop(context);
            callback(true);
          },
        ),
        TextButton(
          child: const Text('아니요'),
          onPressed: () {
            Navigator.pop(context);
            callback(false);
          },
        )
      ],
    ),
  );
}

Future<void> onBackPressedByHome(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        '로그인 화면으로 돌아 가시겠습니까?\n(계정은 자동으로 로그아웃 됩니다.)',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      actions: [
        TextButton(
          child: const Text('예'),
          onPressed: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
        ),
        TextButton(
          child: const Text('아니오'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

Future<void> onBackToHome(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        '로그인 화면으로 돌아 가시겠습니까?\n(진행 중인 상황이 모두 사라집니다.)',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      actions: [
        TextButton(
          child: const Text('예'),
          onPressed: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
        ),
        TextButton(
          child: const Text('아니오'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}
