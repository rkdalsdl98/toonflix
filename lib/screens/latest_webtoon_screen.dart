import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';
import 'package:toonflix/service/controllers/user_controller.dart';
import 'package:toonflix/service/models/WebtoonModel.dart';
import 'package:toonflix/widgets/latest_webtoon/latest_webtoon.dart';

import '../widgets/latest_webtoon/latest_webtoon_colum.dart';

class LatestWebtoonScreen extends StatefulWidget {
  final String identifier;

  const LatestWebtoonScreen({
    super.key,
    required this.identifier,
  });

  @override
  State<LatestWebtoonScreen> createState() => _LatestWebtoonScreenState();
}

class _LatestWebtoonScreenState extends State<LatestWebtoonScreen> {
  PageController pageController = PageController(
    viewportFraction: .85,
  );

  double _currPageValue = 0.0;

  final double _scaleFactor = 0.8;
  late WebtoonModel? _currWebtoon;

  @override
  void initState() {
    super.initState();
    var webtoons = Get.find<UserController>().likeWebtoons;
    _currWebtoon =
        webtoons.isNotEmpty ? webtoons[pageController.initialPage] : null;
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: .1,
            fit: BoxFit.cover,
            image: NetworkImage(
              _currWebtoon != null
                  ? _currWebtoon!.thumb
                  : 'https://image-comic.pstatic.net/webtoon/774044/thumbnail/thumbnail_IMAG21_81504afb-1a05-41b0-9650-0c9aa1d741d9.jpg',
              headers: {
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
              },
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 30 * scaleHeight(context),
            bottom: 150 * scaleHeight(context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.bookmark,
                      color: Colors.red,
                    ),
                    Text(
                      '최근 관심 가진 웹툰',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400 * scaleWidth(context),
                    height: 400 * scaleHeight(context),
                    child: GetBuilder<UserController>(builder: (controller) {
                      final data = controller.likeWebtoons;
                      if (data.isEmpty) {
                        return const Center(
                            child: Text(
                          '관심을 표시한 웹툰이 없습니다.',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ));
                      }
                      return PageView.builder(
                        itemCount: data.length,
                        controller: pageController,
                        onPageChanged: (idx) => _currWebtoon = data[idx],
                        itemBuilder: (context, index) {
                          return LatestWebtoon(
                            position: index,
                            pageValue: _currPageValue,
                            scaleFactor: _scaleFactor,
                            webtoon: data[index],
                            identifier: widget.identifier,
                          );
                        },
                      );
                    }),
                  ),
                  SizedBox(
                    height: 20 * scaleHeight(context),
                  ),
                  LatestWebtoonColum(
                    webtoon: _currWebtoon,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
