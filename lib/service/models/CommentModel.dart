class CommentModel {
  final String commentText, uptime, owner, webtoonId;
  final int ownerId, commentId;
  int likecount, replycount;

  CommentModel.fromJson(Map<String, dynamic> json)
      : commentId = json['id'],
        commentText = json['comment_text'],
        uptime = json['uptime'],
        owner = json['owner'],
        webtoonId = json['webtoon_id'],
        likecount = json['like_count'],
        ownerId = json['owner_id'],
        replycount = json['reply_count'];
}
