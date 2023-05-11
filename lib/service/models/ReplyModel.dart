class ReplyModel {
  final String replyText, owner, uptime;
  final int commentId, ownerId, replyId;

  ReplyModel.fromJson(Map<String, dynamic> json)
      : replyId = json['id'],
        replyText = json['reply_text'],
        owner = json['owner'],
        uptime = json['uptime'],
        commentId = json['comment_id'],
        ownerId = json['owner_id'];
}
