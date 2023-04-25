import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

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
}
