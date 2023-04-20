import 'package:flutter/material.dart';

import '../globalfuncs/Desigh.dart';
import 'IdentifierButton.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
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
        children: const [
          IdentifierButton(
            identifier: 'naver',
          ),
          IdentifierButton(
            identifier: 'kakao',
          ),
          IdentifierButton(
            identifier: 'lezhin',
          ),
          IdentifierButton(
            identifier: 'all',
          ),
        ],
      ),
    );
  }
}
