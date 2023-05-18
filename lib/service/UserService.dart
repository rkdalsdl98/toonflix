import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/service/models/UserModel.dart';

class UserService {
  static Future<bool> login(String userId, String userPass) async {
    final baseurl = dotenv.env['BASEURL_USER'];
    final url = Uri.parse('$baseurl/login');

    final now = DateTime.now();
    final day = now.day;

    final res = await http.post(url, body: {
      "userId": userId,
      "userPass": userPass,
      "day": "$day".padLeft(2, '0')
    });

    if (res.statusCode == 201) {
      final data = jsonDecode(res.body);
      final UserModel user = UserModel.fromJson(data);

      final now = DateTime.now();
      final weekly = now.weekday;

      await saveUserData(user, weekly);

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> checkDuplicatedId(String userId) async {
    final baseurl = dotenv.env['BASEURL_USER'];
    final url = Uri.parse('$baseurl/duplicated/$userId');

    final res = await http.get(url);
    if (res.statusCode == 200) {
      if (res.body == 'true') return true;
      return false;
    }

    throw Error();
  }

  static Future<bool> register(dynamic user) async {
    final baseurl = dotenv.env['BASEURL_USER'];
    final url = Uri.parse('$baseurl/regist');

    final res = await http.post(
      url,
      body: user,
    );

    if (res.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static bool checkBirthForm(String birth) {
    final splitBirth = birth.split('-');
    if (birth.length > 10 && splitBirth.length != 3) {
      return false;
    } else {
      return true;
    }
  }

  static Future<String?> getStorageStringData(String key) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(key);
  }

  static Future<int?> getStorageIntData(String key) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getInt(key);
  }

  static Future<bool?> getStorageBoolData(String key) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getBool(key);
  }

  static Future<void> resetYesterDayData(int day) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final pk = storage.getInt('pk');
    final userId = storage.getString('userId');

    final canReset = await resetLikeWebtoon(userId!, pk!);

    if (canReset) {
      storage.setStringList('liked', []);
      storage.setInt('day', day);
      storage.setString('commentlikes_obj', jsonEncode(<dynamic>[]));
    }
  }

  static Future<void> saveUserData(UserModel model, int day) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    storage.setString('userId', model.userId);
    storage.setString('nickname', model.nickname);
    storage.setStringList(
        'liked',
        model.liked!.contains(',')
            ? model.liked!.split(',')
            : ['${model.liked}']);
    storage.setString('birth', model.birth);
    storage.setInt('pk', model.pk);
    storage.setInt('cash', model.cash);
    storage.setBool('logined', true);
    storage.setInt('day', day);
  }

  static Future<void> setLogined(bool logined) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    if (!logined) {
      final String? list = storage.getString('commentlikes_obj');
      storage.clear();

      if (list != null) {
        final now = DateTime.now();
        final day = now.day;
        final List<dynamic> decodeList = jsonDecode(list);

        if (decodeList[0]["uptime"] == day) {
          storage.setString('commentlikes_obj', list);
        }
        print(decodeList);
      }
    }
    storage.setBool('logined', logined);
  }

  static Future<bool?> getLogined() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getBool('logined');
  }

  static Future<bool> resetLikeWebtoon(String userId, int pk) async {
    final baseurl = dotenv.env['BASEURL_USER'];
    final url = Uri.parse('$baseurl/update/like/reset');

    final res = await http.patch(url, body: {"pk": '$pk', "userId": userId});

    if (res.statusCode == 200) return true;
    return false;
  }

  static Future<bool> updateLikeWebtoon(
      bool isSubtract, String title, String webtoonId) async {
    final baseurl = dotenv.env['BASEURL_USER'];
    final url = Uri.parse('$baseurl/update/like');
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final List<String>? likes = storage.getStringList('liked');
    if (isSubtract) {
      likes!.remove(title);
    } else {
      likes!.add(title);
    }
    storage.setStringList('liked', likes);

    final String list = likes.join(',');

    final res = await http.patch(url, body: {
      "likes": list,
      "webtoon_id": webtoonId,
      "isSubtract": '$isSubtract',
      "pk": '${storage.getInt('pk')}',
      "userId": storage.getString('userId')
    });

    if (res.statusCode == 200) return true;
    return false;
  }

  static Future<bool> addComment(String commentText, String webtoonId) async {
    final baseurl = dotenv.env['BASEURL_COMMENT'];
    final url = Uri.parse('$baseurl/add');
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final baseClock = DateTime.now();
    final String now = "${baseClock.year}-${baseClock.month}-${baseClock.day}";

    final Map<String, dynamic> sendData = {
      "comment_text": commentText,
      "uptime": now,
      "owner": storage.getString('nickname')!,
      "owner_id": "${storage.getInt('pk')}",
      "webtoon_id": webtoonId
    };

    final res = await http.post(url, body: sendData);

    if (res.statusCode == 201) return true;
    return false;
  }

  static Future<bool> addReply(String replytext, String commentId) async {
    final baseurl = dotenv.env['BASEURL_REPLY'];
    final url = Uri.parse('$baseurl/add');
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final baseClock = DateTime.now();
    final String now = "${baseClock.year}-${baseClock.month}-${baseClock.day}";

    final Map<String, dynamic> sendData = {
      "reply_text": replytext,
      "uptime": now,
      "owner": storage.getString('nickname')!,
      "owner_id": "${storage.getInt('pk')}",
      "comment_id": commentId
    };

    final res = await http.post(url, body: sendData);

    if (res.statusCode == 201) return true;
    return false;
  }

  static dynamic findUserDataById(int pk, List<dynamic> list) {
    dynamic foundData;
    for (int i = 0; i < list.length; ++i) {
      if (list[i]["pk"] == pk) {
        foundData = {
          "data": list[i],
          "index": i,
        };
        break;
      }
    }
    return foundData;
  }

  static Future<bool> addLikeComment(String commentId) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    final String? list = storage.getString('commentlikes_obj');
    final int? pk = storage.getInt('pk');

    try {
      if (list == null) {
        final now = DateTime.now();
        final day = now.day;
        final List<dynamic> newList = [
          {
            "pk": pk!,
            "uptime": day,
            "likes": [commentId]
          }
        ];
        final String encodeList = jsonEncode(newList);
        storage.setString('commentlikes_obj', encodeList);
      } else {
        final List<dynamic> decodeList = jsonDecode(list);

        dynamic json = findUserDataById(pk!, decodeList);
        if (json == null) {
          final now = DateTime.now();
          final day = now.day;
          decodeList.add({
            "pk": pk,
            "uptime": day,
            "likes": [commentId]
          });

          final String encodeList = jsonEncode(decodeList);
          storage.setString('commentlikes_obj', encodeList);
          return true;
        }

        dynamic userData = json["data"];
        int index = json["index"];

        List<dynamic> likes = userData["likes"];
        if (likes.contains(commentId)) return false;

        likes.add(commentId);
        userData["likes"] = likes;

        decodeList[index] = userData;

        final String encodeList = jsonEncode(decodeList);
        storage.setString('commentlikes_obj', encodeList);
      }
      return true;
    } catch (e) {
      throw Error();
    }
  }

  /// 1 => 모든 요청 성공
  /// 0 => 서버 업데이트 실패
  /// -1 => 모든 요청 실패
  static Future<int> updateCommentLikeCount(String commentId) async {
    try {
      final bool canAdd = await addLikeComment(commentId);

      if (canAdd) {
        final baseurl = dotenv.env['BASEURL_COMMENT'];
        final url = Uri.parse('$baseurl/like/increase/$commentId');

        final res = await http.patch(url);
        if (res.statusCode == 200) {
          return 1;
        }
        return 0;
      }
      return -1;
    } catch (e) {
      throw Error();
    }
  }
}
