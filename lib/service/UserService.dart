import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<void> login(String userId, String userPass) async {
    final baseurl = dotenv.env['BASEURL_USER'];
    final url = Uri.parse('$baseurl/login');

    final res =
        await http.post(url, body: {"userId": userId, "userPass": userPass});

    if (res.statusCode == 201) {
      print(res.body);
    } else {
      print('실패');
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
}
