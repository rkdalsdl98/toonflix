import 'package:get/get.dart';
import 'package:toonflix/service/UserService.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';

class UserController extends GetxController {
  List<WebtoonModel> _likeWebtoons = [];
  List<WebtoonModel> get likeWebtoons => _likeWebtoons;

  void addLikeWebtoon(WebtoonModel webtoon) {
    if (!_likeWebtoons.contains(webtoon)) {
      if (_likeWebtoons.length == 3) {
        _likeWebtoons.removeAt(0);
      }
      _likeWebtoons.add(webtoon);
    }
    update();
  }

  void deleteLikeWebtoon(WebtoonModel webtoon) {
    if (_likeWebtoons.contains(webtoon)) {
      _likeWebtoons.remove(webtoon);
    }
    update();
  }

  Future<void> initializeLikeWebtoons(List<List<WebtoonModel>> list) async {
    final liked = await UserService.getStorageStringListData('liked');
    if (liked!.isEmpty) return;

    final latestLiked = [...liked];

    _likeWebtoons = [];
    for (var e in list) {
      if (latestLiked.isEmpty) break;
      for (var e2 in e) {
        if (latestLiked.contains(e2.title)) {
          _likeWebtoons.add(e2);
          latestLiked.remove(e2.title);
        }
      }
    }

    update();
  }
}
