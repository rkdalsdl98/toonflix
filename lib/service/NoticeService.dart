import 'dart:convert';

import 'package:toonflix/service/models/NoticeModel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NoticeService {
  static Future<List<NoticeModel>> getNotices() async {
    final baseurl = dotenv.env['BASEURL_NOTICE'];
    final url = Uri.parse('$baseurl/list');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final List<NoticeModel> notices = [];
      final List<dynamic> jsons = jsonDecode(res.body);

      for (var json in jsons) {
        notices.add(NoticeModel.fromJson(json));
      }
      return notices;
    }
    return [];
  }
}
