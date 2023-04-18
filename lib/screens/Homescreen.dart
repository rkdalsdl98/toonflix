import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/System.dart';
import 'package:toonflix/widgets/WebtoonList.dart';

import '../globalfuncs/Desigh.dart';
import '../widgets/BestWebtoon.dart';
import '../widgets/Category.dart';
import '../widgets/GlobalAppBar.dart';
import '../widgets/GlobalMenuBar.dart';

class HomeScreen extends StatefulWidget {
  final String identifier;
  const HomeScreen({
    super.key,
    required this.identifier,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BestWebtoon(),
              const Category(),
              SizedBox(
                height: 520 * scaleHeight(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: WebtoonList(),
                ),
              ),
            ],
          ),
        ),
        onWillPop: () async {
          await onBackPressedByHome(context);
          return false;
        },
      ),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: GlobalAppBar(),
      ),
      bottomNavigationBar: const GlobalMenuBar(),
    );
  }
}
