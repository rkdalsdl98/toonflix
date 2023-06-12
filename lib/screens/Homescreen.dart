import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/System.dart';
import 'package:toonflix/service/ApiService.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';

import '../globalfuncs/Desigh.dart';
import '../widgets/global/GlobalAppBar.dart';
import '../widgets/global/GlobalDrawer.dart';
import '../widgets/global/GlobalMenuBar.dart';
import '../widgets/webtoon/BestWebtoon.dart';
import '../widgets/webtoon/WebtoonList.dart';

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
  late Future<WebtoonModel> bestWebtoon;

  void refreshBestWebtoon() {
    setState(() {
      bestWebtoon = ApiService.getBestWebtoon();
    });
  }

  @override
  void initState() {
    super.initState();
    bestWebtoon = ApiService.getBestWebtoon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return BestWebtoon(
                      webtoon: snapshot.data!,
                      identifier: widget.identifier,
                    );
                  }
                  return const CircularProgressIndicator();
                },
                future: bestWebtoon,
              ),
              SizedBox(
                height: 600 * scaleHeight(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: WebtoonList(
                    identifier: widget.identifier,
                  ),
                ),
              ),
            ],
          ),
        ),
        onWillPop: () async {
          if (widget.identifier != 'guest') {
            await onBackPressedByHome(context);
          }
          return false;
        },
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: GlobalAppBar(
          centerTitle: false,
          showRefreshButtion: true,
          refreshCallback: refreshBestWebtoon,
        ),
      ),
      drawer: Drawer(
        child: GlobalDrawer(
          identifier: widget.identifier,
        ),
      ),
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: GlobalMenuBar(),
    );
  }
}
