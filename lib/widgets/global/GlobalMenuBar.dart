import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';

import '../../globalfuncs/System.dart';

class GlobalMenuBar extends StatefulWidget {
  int selectedIconIdx;

  GlobalMenuBar({
    super.key,
    this.selectedIconIdx = 0,
  });

  @override
  State<GlobalMenuBar> createState() => _GlobalMenuBarState();
}

class _GlobalMenuBarState extends State<GlobalMenuBar> {
  onTapIcon(int idx, BuildContext context) {
    setState(() {
      widget.selectedIconIdx = idx;
      if (idx == 1) {
        Scaffold.of(context).openDrawer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredBottomMenubarHeight,
      child: BottomNavigationBar(
        selectedItemColor: Colors.white.withOpacity(.7),
        selectedFontSize: 12,
        onTap: (int idx) {
          onTapIcon(idx, context);
        },
        currentIndex: widget.selectedIconIdx,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30 * scaleHeight(context),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30 * scaleHeight(context),
            ),
            label: 'My',
          ),
        ],
      ),
    );
  }
}
