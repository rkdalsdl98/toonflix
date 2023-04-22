import 'package:flutter/material.dart';

import '../../globalfuncs/Desigh.dart';

class WebtoonPageButton extends StatelessWidget {
  final String description;
  final String episodeTitle;
  final Color buttonColor;
  bool isDirectionLeft;

  WebtoonPageButton({
    super.key,
    required this.description,
    required this.episodeTitle,
    required this.buttonColor,
    this.isDirectionLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          description,
          style: TextStyle(color: Colors.white.withOpacity(.6)),
        ),
        Container(
          width: 180 * scaleWidth(context),
          height: 50 * scaleHeightExceptMeunbar(context),
          decoration: BoxDecoration(
            color: buttonColor.withOpacity(.6),
            borderRadius: isDirectionLeft
                ? const BorderRadius.horizontal(
                    left: Radius.circular(45),
                  )
                : const BorderRadius.horizontal(
                    right: Radius.circular(45),
                  ),
          ),
          child: Center(child: Text(episodeTitle)),
        ),
      ],
    );
  }
}
