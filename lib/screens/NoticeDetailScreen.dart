import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';
import 'package:toonflix/service/models/NoticeModel.dart';

import '../widgets/global/GlobalAppBar.dart';

class NoticeDetailScreen extends StatelessWidget {
  final NoticeModel notice;
  const NoticeDetailScreen({
    super.key,
    required this.notice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: GlobalAppBar(
          centerTitle: true,
          showRefreshButtion: false,
          showDefaultLeading: true,
          titleText: '공지사항',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notice.category,
                style: TextStyle(
                  color: noticeColor[notice.category]!,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10 * scaleHeight(context),
              ),
              Text(
                notice.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10 * scaleHeight(context),
              ),
              Text(
                notice.updateAt,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(.6),
                ),
              ),
              SizedBox(
                height: 40 * scaleHeight(context),
              ),
              Text(
                notice.content,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 60 * scaleHeight(context),
              ),
              ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFFD9DDEB),
                  ),
                ),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const SizedBox(
                    width: double.maxFinite,
                    child: Center(
                      child: Text(
                        '돌아가기',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30 * scaleHeight(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
