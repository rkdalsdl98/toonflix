import 'package:flutter/material.dart';
import 'package:toonflix/screens/latest_webtoon_screen.dart';

import '../../screens/NoticeScreen.dart';
import '../sidebar/UserProfile.dart';
import 'MenuButton.dart';

class GlobalDrawer extends StatefulWidget {
  final String identifier;
  bool showMenus;

  GlobalDrawer({
    super.key,
    this.showMenus = false,
    required this.identifier,
  });

  @override
  State<GlobalDrawer> createState() => _GlobalDrawerState();
}

class _GlobalDrawerState extends State<GlobalDrawer> {
  void setShowMenus() => setState(() {
        widget.showMenus = !widget.showMenus;
      });

  @override
  void initState() {
    super.initState();
    widget.showMenus = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserProfile(
          onPressDetail: setShowMenus,
          identifier: widget.identifier,
        ),
        if (widget.showMenus)
          Column(
            children: [
              MenuButton(
                menuIcon: Icons.campaign_rounded,
                menuTitle: '공지사항',
                iconColor: Colors.white,
                callback: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NoticeScreen()),
                ),
              ),
              MenuButton(
                menuIcon: Icons.bookmark,
                menuTitle: '최근 관심 가진 웹툰',
                iconColor: Colors.red,
                callback: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LatestWebtoonScreen(
                            identifier: widget.identifier,
                          )),
                ),
              ),
            ],
          )
      ],
    );
  }
}
