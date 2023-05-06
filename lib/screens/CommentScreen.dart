import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';
import 'package:toonflix/globalfuncs/System.dart';
import 'package:toonflix/service/ApiService.dart';
import 'package:toonflix/service/models/CommentModel.dart';
import 'package:toonflix/widgets/comment/CommentList.dart';

class CommentScreen extends StatefulWidget {
  final String webtoonId;
  const CommentScreen({
    super.key,
    required this.webtoonId,
  });

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController controller = TextEditingController();
  late Future<List<CommentModel>> comments;

  @override
  void initState() {
    super.initState();
    comments = ApiService.getWebtoonsComments(widget.webtoonId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: controller,
            maxLines: 2,
            maxLength: 255,
            decoration: InputDecoration(
              hintText: '로그인 하신후에 작성할 수 있습니다.',
              filled: true,
              fillColor: const Color(0xFF444444).withOpacity(.6),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 180 * scaleWidth(context),
                height: 50 * scaleHeight(context),
                decoration: BoxDecoration(
                  color: const Color(0xFFE21221).withOpacity(.6),
                  borderRadius: const BorderRadius.all(Radius.circular(45)),
                ),
                child: const Center(
                  child: AutoSizeText(
                    '의견 남기기',
                    minFontSize: 12,
                    maxFontSize: 14,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: comments,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CommentList(comments: snapshot.data!);
                }
                return const CommentList(
                  comments: [],
                );
              },
            ),
          )
        ],
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: SizedBox(
          height: preferredAppBarHeight,
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: const Text(
              '추천 456   의견 122',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
            ],
          ),
        ),
      ),
    );
  }
}
