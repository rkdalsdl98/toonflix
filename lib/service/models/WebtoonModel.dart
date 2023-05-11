class WebtoonModel {
  final String title, thumb, webtoonid, company, genre, age, about;
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
        age = json['age'],
        about = json['about'],
        commentcount = json['comment_count'];
}
