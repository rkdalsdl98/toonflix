import 'package:get/get.dart';
import 'package:toonflix/service/controllers/user_controller.dart';

Future<void> init() async {
  Get.lazyPut(() => UserController());
}
