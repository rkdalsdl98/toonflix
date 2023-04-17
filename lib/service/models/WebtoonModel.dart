class WebtoonModel {
  final String title, thumb, webtoonid, company;
  final int likecount, price, weekly;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        likecount = json['like_count'],
        webtoonid = json['webtoon_id'],
        company = json['company'],
        price = json['price'],
        weekly = json['weekly'];
}
