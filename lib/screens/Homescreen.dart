import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Systeam.dart';

import '../widgets/GlobalAppBar.dart';

class HomeScreen extends StatelessWidget {
  final String identifier;
  const HomeScreen({
    super.key,
    required this.identifier,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: const Text('hi'),
        onWillPop: () async {
          await onBackPressed(context);
          return false;
        },
      ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: GlobalAppBar(),
      ),
    );
  }
}
