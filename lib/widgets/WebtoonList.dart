import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';
import 'package:toonflix/service/ApiService.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';
import 'package:toonflix/widgets/WebtoonColum.dart';

class WebtoonList extends StatefulWidget {
  const WebtoonList({super.key});

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
          final webtoonsList = snapshot.data!;
          return ListView.separated(
            itemCount: webtoonsList.length,
            itemBuilder: (context, idx) {
              var webtoonColum = webtoonsList[idx];
              return WebtoonColum(
                webtoonColum: webtoonColum,
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
