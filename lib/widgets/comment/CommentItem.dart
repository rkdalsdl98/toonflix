import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';
import 'package:toonflix/service/models/CommentModel.dart';

class CommentItem extends StatelessWidget {
  final CommentModel commentData;
  const CommentItem({
    super.key,
    required this.commentData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: AutoSizeText(
                      commentData.owner,
                      minFontSize: 16,
                      maxFontSize: 24,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  AutoSizeText(
                    commentData.uptime,
                    minFontSize: 13,
                    maxFontSize: 17,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(.5),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 20 * scaleWidth(context),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Color(0xFFE21221),
                        size: 18,
                      ),
                      SizedBox(
                        width: 5 * scaleWidth(context),
                      ),
                      AutoSizeText(
                        '${commentData.likecount}명',
                        textAlign: TextAlign.center,
                        minFontSize: 10,
                        maxFontSize: 14,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.5)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20 * scaleWidth(context),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.mode_comment_rounded,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5 * scaleWidth(context),
                      ),
                      AutoSizeText(
                        '${commentData.replycount}개',
                        textAlign: TextAlign.center,
                        minFontSize: 10,
                        maxFontSize: 14,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.5)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20 * scaleWidth(context),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: AutoSizeText(
              commentData.commentText,
              minFontSize: 12,
              maxFontSize: 16,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
