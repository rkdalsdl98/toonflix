import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';
import 'package:toonflix/service/models/CommentModel.dart';

class CommentList extends StatelessWidget {
  final List<CommentModel> comments;
  const CommentList({
    super.key,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: comments.isEmpty ? 1 : comments.length,
      itemBuilder: (context, idx) {
        if (comments.isEmpty) return const Text('쏘링 코멘트가 없떵...');
        return const Text('hi');
      },
      separatorBuilder: (context, idx) {
        return SizedBox(
          height: 10 * scaleHeight(context),
        );
      },
    );
  }
}
