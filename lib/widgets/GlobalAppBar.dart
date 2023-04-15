import 'package:flutter/material.dart';

import '../globalfuncs/Desigh.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Image.asset(
        'assets/icons/toonflixlogo_translucent.png',
        width: 80 * scaleWidth(context),
        height: 80 * scaleWidth(context),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
