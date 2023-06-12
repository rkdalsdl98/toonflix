import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';
import 'package:toonflix/service/ApiService.dart';
import 'package:toonflix/service/controllers/user_controller.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';
import 'package:toonflix/widgets/home/Category.dart';

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

  onChangeCategory(String category) {
    webtoons = ApiService.getTodaysToons(category);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    webtoons = ApiService.getTodaysToons('all');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Category(callChangeCategory: onChangeCategory),
        Expanded(
          child: FutureBuilder(
            future: webtoons,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<List<WebtoonModel>> webtoonList = snapshot.data!;
                Get.find<UserController>().initializeLikeWebtoons(webtoonList);
                return ListView.separated(
                  itemCount: webtoonList.length,
                  itemBuilder: (context, idx) {
                    final List<WebtoonModel> webtoonColum = webtoonList[idx];
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
          ),
        ),
      ],
    );
  }
}
