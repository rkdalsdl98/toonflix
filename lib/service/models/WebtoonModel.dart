class WebtoonModel {
  final String title, thumb, webtoonid, company, genre, age, about;
  final int likecount, price, weekly, commentcount;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        likecount = json['like_count'],
        webtoonid = json['webtoon_id'],
        company = json['company'],
        price = json['price'],
        weekly = json['weekly'],
        genre = json['genre'],
        age = json['age'],
        about = json['about'],
        commentcount = json['comment_count'];
}
