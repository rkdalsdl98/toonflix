import 'package:flutter/material.dart';
import 'package:toonflix/screens/NoticeDetailScreen.dart';

import '../../globalfuncs/Desigh.dart';
import '../../service/models/NoticeModel.dart';
import 'NoticeCategory.dart';

class Notice extends StatelessWidget {
  const Notice({
    super.key,
    required this.notice,
  });

  final NoticeModel notice;

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NoticeDetailScreen(
                  notice: notice,
                )),
      );
    }

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: const Color(0xFFD9DDEB).withOpacity(.3),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NoticeCategory(
                  category: notice.category,
                  textColor: noticeColor[notice.category]!,
                  backgroundColor: noticeColor[notice.category]!,
                ),
                SizedBox(
                  height: 10 * scaleHeight(context),
                ),
                Text(
                  notice.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Text(
              notice.updateAt,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
