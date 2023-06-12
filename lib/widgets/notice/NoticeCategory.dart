import 'package:flutter/material.dart';

import '../../globalfuncs/Desigh.dart';

class NoticeCategory extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String category;

  const NoticeCategory({
    super.key,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.white,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64 * scaleWidth(context),
      height: 24 * scaleHeight(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        color: textColor.withOpacity(.5),
      ),
      child: Center(
        child: Text(
          category,
          style: TextStyle(
            color: backgroundColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
