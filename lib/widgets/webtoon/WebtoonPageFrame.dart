import 'package:flutter/material.dart';
import 'package:toonflix/service/ApiService.dart';
import 'package:toonflix/service/models/EpisodeModel.dart';

import '../../globalfuncs/Desigh.dart';
import 'WebtoonPageButton.dart';

class WebtoonPageFrame extends StatefulWidget {
  final String webtoonId;

  const WebtoonPageFrame({
    super.key,
    required this.webtoonId,
  });

  @override
  State<WebtoonPageFrame> createState() => _WebtoonPageFrameState();
}

class _WebtoonPageFrameState extends State<WebtoonPageFrame> {
  late Future<EpisodeModel> _episode;

  @override
  void initState() {
    super.initState();
    _episode = ApiService.getEpisodeById(widget.webtoonId);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125 * scaleHeightExceptMeunbar(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: FutureBuilder(
          future: _episode,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var episodeData = snapshot.data!;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WebtoonPageButton(
                    buttonColor: const Color(0xFFE21221),
                    description: '최신화 부터 볼래요!',
                    episode: episodeData,
                    webtoonId: widget.webtoonId,
                  ),
                  WebtoonPageButton(
                    buttonColor: Colors.white,
                    description: '처음부터 정주행 할래요!',
                    isDirectionLeft: false,
                    episode: episodeData,
                    webtoonId: widget.webtoonId,
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
