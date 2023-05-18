import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/service/models/ReplyModel.dart';

import '../../globalfuncs/Desigh.dart';

class Replyitem extends StatefulWidget {
  final bool enableActions;
  final ReplyModel replyData;

  const Replyitem({
    super.key,
    required this.enableActions,
    required this.replyData,
  });

  @override
  State<Replyitem> createState() => _ReplyitemState();
}

class _ReplyitemState extends State<Replyitem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 25 * scaleWidth(context),
                    height: 0,
                  ),
                  Container(
                    height: 20 * scaleHeight(context),
                    width: 20 * scaleWidth(context),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 1, color: Color(0xFF444444)),
                        bottom: BorderSide(width: 1, color: Color(0xFF444444)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: AutoSizeText(
                      widget.replyData.owner,
                      minFontSize: 12,
                      maxFontSize: 16,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  AutoSizeText(
                    '작성일 ${widget.replyData.uptime}',
                    minFontSize: 11,
                    maxFontSize: 15,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(.5),
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    width: 10 * scaleWidth(context),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 70 * scaleWidth(context),
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: AutoSizeText(
                  widget.replyData.replyText,
                  minFontSize: 10,
                  maxFontSize: 14,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
