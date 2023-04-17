import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/WebtoonModel.dart';

class ApiService {
  static const String BASEURL = 'http://175.210.132.15:3000/webtoon';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$BASEURL/list');
    final res = await http.get(url);
    List<WebtoonModel> webtoons = [];

    if (res.statusCode == 200) {
      final List<dynamic> list = jsonDecode(res.body);
      for (var json in list) {
        final WebtoonModel webtoon = WebtoonModel.fromJson(json);
        webtoons.add(webtoon);
      }
      return webtoons;
    }

    throw Error();
  }
}
