class NoticeModel {
  final String content, category, updateAt, title;
  dynamic imageUrl;

  NoticeModel.fromJson(Map<String, dynamic> json)
      : content = json['content'],
        category = json['category'],
        imageUrl = json['imageUrl'],
        updateAt = json['updateAt'],
        title = json['title'];
}
