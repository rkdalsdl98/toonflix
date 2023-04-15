import 'package:flutter/material.dart';

Future<void> onBackPressed(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        '로그인 화면으로 돌아 가시겠습니까?\n(계정은 자동으로 로그아웃 됩니다.)',
        style: TextStyle(
          fontSize: 18,
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
