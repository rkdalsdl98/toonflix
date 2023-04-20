import 'package:flutter/material.dart';

import '../sidebar/UserProfile.dart';
import 'VerticalAnimateButton.dart';

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
        if (widget.showMenus) const VerticalAnimateButton()
      ],
    );
  }
}
