class UserModel {
  final String nickname, birth;
  final String? liked;
  final int cash;

  UserModel.fromJson(Map<String, dynamic> json)
      : cash = json['cash'],
        liked = json['liked'] ?? "",
        nickname = json['nickname'],
        birth = json['birth'];
}
