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
  double toonflixIconTranslateY = 0;

  onTapIcon(int idx, BuildContext context) {
    setState(() {
      widget.selectedIconIdx = idx;
      if (idx == 1) {
        toonflixIconTranslateY = -10;
      } else if (idx == 2) {
        Scaffold.of(context).openDrawer();
      } else {
        toonflixIconTranslateY = 0;
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
            icon: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              transform: Matrix4(
                1, // scale X
                0, // rotate Y
                0,
                0,
                0, // rotate X
                1, // scale Y
                0,
                0,
                0,
                0,
                1,
                0,
                0, // translate X
                toonflixIconTranslateY, // translate Y
                0,
                1,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 27, 26, 26).withOpacity(.6),
                borderRadius: BorderRadius.circular(45),
              ),
              child: Image.asset(
                'assets/icons/toonflixlogo_translucent.png',
                height: 50 * scaleHeight(context),
              ),
            ),
            label: '',
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
