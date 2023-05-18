class UserLikedRequest {
  final String likes, webtoonId, userId;
  final int pk;
  final bool isSubtract;

  UserLikedRequest.makeRequest(Map<String, dynamic> obj)
      : likes = obj['likes'],
        webtoonId = obj['webtoonId'],
        userId = obj['userId'],
        pk = obj['pk'],
        isSubtract = obj['isSubtract'];
}
