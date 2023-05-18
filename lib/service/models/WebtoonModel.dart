class WebtoonModel {
  final String title, thumb, webtoonid, company, genre;
  final int likecount, price, day, commentcount;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        likecount = json['like_count'],
        webtoonid = json['webtoon_id'],
        company = json['company'],
        price = json['price'],
        day = json['day'],
        genre = json['genre'],
        commentcount = json['comment_count'];
}
