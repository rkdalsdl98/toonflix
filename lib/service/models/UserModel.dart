class UserModel {
  final String nickname, birth, userId;
  final String? liked;
  final int cash, pk;

  UserModel.fromJson(Map<String, dynamic> json)
      : cash = json['cash'],
        liked = json['liked'] ?? "",
        nickname = json['nickname'],
        birth = json['birth'],
        pk = json['pk'],
        userId = json['userId'];
}
