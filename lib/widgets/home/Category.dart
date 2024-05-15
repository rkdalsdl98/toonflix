import 'package:flutter/material.dart';
import '../../globalfuncs/Desigh.dart';
import 'IdentifierButton.dart';

class Category extends StatelessWidget {
  final Function(String) callChangeCategory;

  const Category({
    super.key,
    required this.callChangeCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(),
      )),
      height: 80 * scaleHeight(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IdentifierButton(
            identifier: 'naver',
            callChangeCategory: callChangeCategory,
          ),
          IdentifierButton(
            identifier: 'kakao',
            callChangeCategory: callChangeCategory,
          ),
          IdentifierButton(
            identifier: 'lezhin',
            callChangeCategory: callChangeCategory,
          ),
          IdentifierButton(
            identifier: 'all',
            callChangeCategory: callChangeCategory,
          ),
        ],
      ),
    );
  }
}
