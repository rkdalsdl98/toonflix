import 'package:flutter/material.dart';

import '../../globalfuncs/Desigh.dart';

class BestWebtoon extends StatelessWidget {
  const BestWebtoon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520 * scaleHeight(context),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/icons/화산귀환.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}
