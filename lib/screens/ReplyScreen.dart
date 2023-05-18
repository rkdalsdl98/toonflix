import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';
import 'package:toonflix/service/ApiService.dart';
import 'package:toonflix/service/models/ReplyModel.dart';
import 'package:toonflix/widgets/comment/CommentItem.dart';
import 'package:toonflix/widgets/comment/ReplyItem.dart';
import 'package:toonflix/widgets/global/GlobalAppBar.dart';

import '../globalfuncs/System.dart';
import '../service/UserService.dart';

class ReplyScreen extends StatefulWidget {
  final CommentItem toCommentWidget;
  final void Function() updateReplyCount;

  const ReplyScreen({
    super.key,
    required this.toCommentWidget,
    required this.updateReplyCount,
  });

  @override
  State<ReplyScreen> createState() => _ReplyScreenState();
}

class _ReplyScreenState extends State<ReplyScreen> {
  TextEditingController controller = TextEditingController();
  FocusNode focus = FocusNode();
  late Future<List<ReplyModel>> replys;

  refreshList() async {
    replys = ApiService.getCommentReplys(
        widget.toCommentWidget.commentData.commentId);
    setState(() {});
  }

  onSubmitReply() async {
    if (controller.text.isEmpty) {
      await alertMessage(
          widget.toCommentWidget.enableActions
              ? '내용을 입력해 주세요.'
              : '로그인 이후에 이용이 가능합니다.',
          context,
          false);
      return;
    }

    final bool res = await UserService.addReply(
        controller.text, '${widget.toCommentWidget.commentData.commentId}');

    if (!res && context.mounted) {
      await alertMessage('의견을 남기는데 실패했습니다.', context, false);
    } else {
      widget.updateReplyCount();
    }

    controller.clear();
    focus.unfocus();
    await refreshList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.toCommentWidget.activePressEvent = false;
    replys = ApiService.getCommentReplys(
        widget.toCommentWidget.commentData.commentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFF444444)),
                ),
              ),
              child: widget.toCommentWidget,
            ),
            Expanded(
              child: FutureBuilder(
                future: replys,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final replys = snapshot.data!;
                    return ListView.builder(
                        itemBuilder: (context, idx) {
                          return Replyitem(
                            enableActions: widget.toCommentWidget.enableActions,
                            replyData: replys[idx],
                          );
                        },
                        itemCount: snapshot.data!.length);
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              height: 125 * scaleHeightExceptMeunbar(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: onSubmitReply,
                      child: Container(
                        width: 160 * scaleWidth(context),
                        height: 40 * scaleHeight(context),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE21221).withOpacity(.6),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(45)),
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
                  TextField(
                    controller: controller,
                    focusNode: focus,
                    maxLines: 1,
                    maxLength: 100,
                    decoration: InputDecoration(
                      hintText: widget.toCommentWidget.enableActions
                          ? '여러분의 의견을 남겨주세요!'
                          : '로그인 하신후에 작성할 수 있습니다.',
                      filled: true,
                      fillColor: const Color(0xFF444444).withOpacity(.6),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: GlobalAppBar(
          centerTitle: true,
          showRefreshButtion: false,
          titleText: '답글',
          showDefaultLeading: true,
        ),
      ),
    );
  }
}
