class CommentModel {
  final String commentText, uptime, owner, webtoonId;
  final int likecount, ownerId, commentId;

  CommentModel.fromJson(Map<String, dynamic> json)
      : commentId = json['id'],
        commentText = json['comment_text'],
        uptime = json['uptime'],
        owner = json['owner'],
        webtoonId = json['wetoon_id'],
        likecount = json['like_count'],
        ownerId = json['owner_id'];
}
