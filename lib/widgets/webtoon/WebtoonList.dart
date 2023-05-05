import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';
import 'package:toonflix/service/ApiService.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';

import 'WebtoonColum.dart';

class WebtoonList extends StatefulWidget {
  final String identifier;

  const WebtoonList({
    super.key,
    required this.identifier,
  });

  @override
  State<WebtoonList> createState() => _WebtoonListState();
}

class _WebtoonListState extends State<WebtoonList> {
  late Future<List<List<WebtoonModel>>> webtoons;

  @override
  void initState() {
    super.initState();
    webtoons = ApiService.getTodaysToons();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: webtoons,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final webtoonList = snapshot.data!;
          return ListView.separated(
            itemCount: webtoonList.length,
            itemBuilder: (context, idx) {
              var webtoonColum = webtoonList[idx];
              return WebtoonColum(
                webtoonColum: webtoonColum,
                identifier: widget.identifier,
              );
            },
            separatorBuilder: (context, idx) => SizedBox(
              height: 20 * scaleHeight(context),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
