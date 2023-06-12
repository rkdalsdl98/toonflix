import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toonflix/service/controllers/user_controller.dart';
import 'package:toonflix/widgets/webtoon/Webtoon.dart';

class UserProfile extends StatelessWidget {
  final void Function() onPressDetail;
  final UserController userController = Get.find<UserController>();
  final String identifier;

  UserProfile({
    super.key,
    required this.onPressDetail,
    required this.identifier,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      final likeWebtoons = controller.likeWebtoons;
      final latestWebtoons = likeWebtoons.getRange(
          likeWebtoons.length > 3 ? likeWebtoons.length - 3 : 0,
          likeWebtoons.length);

      return UserAccountsDrawerHeader(
        accountName: const AutoSizeText(
          'yeh.shaa_',
          style: TextStyle(fontSize: 18, color: Color(0xFFCA7979)),
        ),
        accountEmail: const AutoSizeText(
          'yeh.shaa_@gmail.com',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        currentAccountPicture: const CircleAvatar(
          backgroundImage: AssetImage('assets/icons/물만두.png'),
        ),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        onDetailsPressed: onPressDetail,
        otherAccountsPictures: [
          for (var webtoon in latestWebtoons)
            Webtoon(
              webtoon: webtoon,
              identifier: identifier,
              isBestWebtoon: true,
              otherIdentifierCode: 1,
            )
        ],
      );
    });
  }
}
