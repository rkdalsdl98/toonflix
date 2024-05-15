import 'package:flutter/material.dart';
import 'package:toonflix/service/NoticeService.dart';
import 'package:toonflix/service/models/NoticeModel.dart';

import '../widgets/global/GlobalAppBar.dart';
import '../widgets/notice/NoticeWidget.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({super.key});

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  late Future<List<NoticeModel>> _notices;

  @override
  void initState() {
    super.initState();
    _notices = NoticeService.getNotices();
  }

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
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final notices = snapshot.data!.reversed;
            return SingleChildScrollView(
              child: Column(
                children: [for (var notice in notices) Notice(notice: notice)],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: _notices,
      ),
    );
  }
}
