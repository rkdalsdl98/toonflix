import 'package:flutter/material.dart';

import '../sidebar/UserProfile.dart';
import 'MenuButton.dart';

class GlobalDrawer extends StatefulWidget {
  bool showMenus;

  GlobalDrawer({
    super.key,
    this.showMenus = false,
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
        ),
        if (widget.showMenus)
          Column(
            children: const [
              MenuButton(
                menuIcon: Icons.favorite,
                menuTitle: '찜 목록',
                iconColor: Colors.red,
              ),
              MenuButton(
                menuIcon: Icons.message_rounded,
                menuTitle: '내가 쓴 의견',
                iconColor: Colors.white,
              ),
              MenuButton(
                menuIcon: Icons.campaign_rounded,
                menuTitle: '공지사항',
                iconColor: Colors.white,
              ),
            ],
          )
      ],
    );
  }
}
