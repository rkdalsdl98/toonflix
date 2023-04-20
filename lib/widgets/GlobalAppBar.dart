import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/System.dart';

class GlobalAppBar extends StatelessWidget {
  final bool centerTitle;

  const GlobalAppBar({
    super.key,
    required this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredAppBarHeight,
      child: AppBar(
        centerTitle: centerTitle,
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
