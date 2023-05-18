import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:toonflix/service/models/CommentModel.dart';
import 'package:toonflix/service/models/CountsModel.dart';
import 'package:toonflix/service/models/ReplyModel.dart';

import 'models/EpisodeModel.dart';
import 'models/WebtoonModel.dart';

class ApiService {
  static Future<List<List<WebtoonModel>>> getTodaysToons() async {
    final baseurl = dotenv.env['BASEURL'];
    final url = Uri.parse('$baseurl/list');
    final res = await http.get(url);
    List<List<WebtoonModel>> webtoons = [];

    if (res.statusCode == 200) {
      final List<dynamic> list = jsonDecode(res.body);
      List<WebtoonModel> webtoonColum = [];
      int cnt = 0;

      for (var json in list) {
        final WebtoonModel webtoon = WebtoonModel.fromJson(json);
        webtoonColum.add(webtoon);
        ++cnt;
        if (cnt > 3) {
          webtoons.add([...webtoonColum]);
          webtoonColum.clear();
          cnt = 0;
        }
      }

      if (webtoonColum.isNotEmpty) webtoons.add(webtoonColum);
      return webtoons;
    }

    throw Error();
  }

  static Future<EpisodeModel> getEpisodeById(String webtoonId) async {
    final baseurl = dotenv.env['BASEURL'];
    final url = Uri.parse('$baseurl/$webtoonId/episode');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final dynamic json = jsonDecode(res.body);
      final EpisodeModel episode = EpisodeModel.fromJson(json);
      return episode;
    }
    throw Error();
  }

  static Future<CountsModel> getWebtoonCounts(String webtoonId) async {
    final baseurl = dotenv.env['BASEURL'];
    final url = Uri.parse('$baseurl/counts/$webtoonId');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final dynamic json = jsonDecode(res.body);
      final CountsModel counts = CountsModel.fromJson(json);
      return counts;
    }
    throw Error();
  }

  static Future<bool> increaseLikeCount(String webtoonId) async {
    final baseurl = dotenv.env['BASEURL'];
    final url = Uri.parse('$baseurl/increase/like/$webtoonId');
    final res = await http.patch(url);

    if (res.statusCode == 200) return true;
    return false;
  }

  static Future<bool> subtractLikeCount(String webtoonId) async {
    final baseurl = dotenv.env['BASEURL'];
    final url = Uri.parse('$baseurl/subtract/like/$webtoonId');
    final res = await http.patch(url);

    if (res.statusCode == 200) return true;
    return false;
  }

  static Future<List<CommentModel>> getWebtoonsComments(
      String webtoonId) async {
    final baseurl = dotenv.env['BASEURL_COMMENT'];
    final url = Uri.parse('$baseurl/$webtoonId/all');
    final res = await http.get(url);

    final List<CommentModel> comments = [];
    if (res.statusCode == 200) {
      final List<dynamic> json = jsonDecode(res.body);

      for (var data in json) {
        final CommentModel comment = CommentModel.fromJson(data);
        comments.add(comment);
      }
    }
    return comments;
  }

  static Future<List<ReplyModel>> getCommentReplys(int commentId) async {
    final baseurl = dotenv.env['BASEURL_REPLY'];
    final url = Uri.parse('$baseurl/all/$commentId');
    final res = await http.get(url);

    final List<ReplyModel> replys = [];
    if (res.statusCode == 200) {
      final List<dynamic> json = jsonDecode(res.body);

      for (var data in json) {
        final ReplyModel reply = ReplyModel.fromJson(data);
        replys.add(reply);
      }
    }
    return replys;
  }
}
