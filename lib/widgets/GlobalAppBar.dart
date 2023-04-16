import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/System.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredAppBarHeight,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/icons/toonflixlogo_translucent.png',
          width: 48,
          height: 48,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
