import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/service/models/UserModel.dart';

class UserService {
  static Future<bool> login(String userId, String userPass) async {
    final baseurl = dotenv.env['BASEURL_USER'];
    final url = Uri.parse('$baseurl/login');

    final res =
        await http.post(url, body: {"userId": userId, "userPass": userPass});

    if (res.statusCode == 201) {
      final data = jsonDecode(res.body);
      final UserModel user = UserModel.fromJson(data);
      await saveUserData(user);

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

  static Future<void> saveUserData(UserModel model) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    storage.setString('nickname', model.nickname);
    storage.setString('liked', model.liked!);
    storage.setString('birth', model.birth);
    storage.setInt('cash', model.cash);
    storage.setBool('logined', true);
  }

  static Future<void> setLogined(bool logined) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    if (!logined) {
      storage.clear();
    }
    storage.setBool('logined', logined);
  }

  static Future<bool?> getLogined() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getBool('logined');
  }
}
