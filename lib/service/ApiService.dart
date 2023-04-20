import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/WebtoonModel.dart';

class ApiService {
  static const String BASEURL = 'http://175.210.132.15:3000/webtoon';

  static Future<List<List<WebtoonModel>>> getTodaysToons() async {
    final url = Uri.parse('$BASEURL/list');
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
}
