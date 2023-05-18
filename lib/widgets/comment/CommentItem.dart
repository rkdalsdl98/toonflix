import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';
import 'package:toonflix/globalfuncs/System.dart';
import 'package:toonflix/screens/ReplyScreen.dart';
import 'package:toonflix/service/UserService.dart';
import 'package:toonflix/service/models/CommentModel.dart';

class CommentItem extends StatefulWidget {
  bool activePressEvent = true;

  final CommentModel commentData;
  final bool enableActions;
  final bool isLikedComment;

  CommentItem({
    super.key,
    required this.commentData,
    required this.enableActions,
    required this.isLikedComment,
  });

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  onPressFavorite() async {
    if (widget.activePressEvent) {
      if (widget.enableActions) {
        final int res = await UserService.updateCommentLikeCount(
            '${widget.commentData.commentId}');

        if (context.mounted) {
          switch (res) {
            case 0:
              await alertMessage('서버에 오류가 발생했습니다.', context, false);
              break;
            case -1:
              await alertMessage('이미 관심을 표시한 글입니다.', context, false);
              break;
            case 1:
              ++widget.commentData.likecount;
              break;
          }
        }
      } else {
        await alertMessage('로그인 이후에 이용이 가능합니다.', context, false);
      }
    }
    setState(() {});
  }

  onPressReply() async {
    if (widget.activePressEvent) {
      if (widget.enableActions) {
        CommentItem copyThis = CommentItem(
          commentData: widget.commentData,
          enableActions: widget.enableActions,
          isLikedComment: widget.isLikedComment,
        );

        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ReplyScreen(
              toCommentWidget: copyThis,
              updateReplyCount: increaseReplyCount,
            );
          },
        ));
      } else {
        await alertMessage('로그인 이후에 이용이 가능합니다.', context, false);
      }
    }
    setState(() {});
  }

  increaseReplyCount() {
    ++widget.commentData.replycount;
    setState(() {});
  }

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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: AutoSizeText(
                      widget.commentData.owner,
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
                    '작성일 ${widget.commentData.uptime}',
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
                  GestureDetector(
                    onTap: onPressFavorite,
                    child: Row(
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
                          '${widget.commentData.likecount}명',
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
                  ),
                  SizedBox(
                    width: 20 * scaleWidth(context),
                  ),
                  GestureDetector(
                    onTap: onPressReply,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.mode_comment_rounded,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5 * scaleWidth(context),
                        ),
                        AutoSizeText(
                          '${widget.commentData.replycount}개',
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
              widget.commentData.commentText,
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
