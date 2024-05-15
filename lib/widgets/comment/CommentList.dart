import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';
import 'package:toonflix/service/models/CommentModel.dart';

import 'CommentItem.dart';

class CommentList extends StatelessWidget {
  final List<CommentModel> comments;
  final bool enableActions;

  const CommentList({
    super.key,
    required this.comments,
    required this.enableActions,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: comments.isEmpty ? 1 : comments.length,
      itemBuilder: (context, idx) {
        if (comments.isEmpty) {
          return Center(
            child: Text(
              '첫 의견을 남기는 주인공이 되어보세요!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(.35),
              ),
            ),
          );
        }
        return CommentItem(
          commentData: comments[idx],
          enableActions: enableActions,
          isLikedComment: false,
        );
      },
      separatorBuilder: (context, idx) {
        return SizedBox(
          height: 10 * scaleHeight(context),
        );
      },
    );
  }
}
