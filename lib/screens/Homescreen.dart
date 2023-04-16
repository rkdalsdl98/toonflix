import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/System.dart';

import '../globalfuncs/Desigh.dart';
import '../widgets/BestWebtoon.dart';
import '../widgets/GlobalAppBar.dart';
import '../widgets/IdentifierButton.dart';
import '../widgets/Webtoon.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BestWebtoon(),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(),
                )),
                height: 80 * scaleHeight(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    IdentifierButton(
                      identifier: 'naver',
                    ),
                    IdentifierButton(
                      identifier: 'kakao',
                    ),
                    IdentifierButton(
                      identifier: 'lezhin',
                    ),
                    IdentifierButton(
                      identifier: 'all',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 520 * scaleHeight(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Webtoon(
                              identifier: 'naver',
                              identifierColor: const Color(0xFF00DC64),
                              title: '화산귀환'),
                        ],
                      ),
                    ],
                  ),
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
    );
  }
}
