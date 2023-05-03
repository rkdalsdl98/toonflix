class CountsModel {
  int likecount, commentcount;

  CountsModel.fromJson(Map<String, dynamic> json)
      : likecount = json['likecount'],
        commentcount = json['commentcount'];
}
