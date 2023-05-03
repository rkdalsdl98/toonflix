import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/System.dart';

class GlobalAppBar extends StatefulWidget {
  final bool centerTitle;
  final bool showRefreshButtion;
  dynamic refreshCallback;
  String? titleText;

  GlobalAppBar({
    super.key,
    required this.centerTitle,
    this.titleText,
    required this.showRefreshButtion,
    this.refreshCallback,
  });

  @override
  State<GlobalAppBar> createState() => _GlobalAppBarState();
}

class _GlobalAppBarState extends State<GlobalAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredAppBarHeight,
      child: AppBar(
        centerTitle: widget.centerTitle,
        automaticallyImplyLeading: false,
        title: widget.titleText != null
            ? Text(widget.titleText!)
            : Image.asset(
                'assets/icons/toonflixlogo_translucent.png',
                width: 48,
                height: 48,
              ),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          if (widget.showRefreshButtion)
            IconButton(
                onPressed: () {
                  if (widget.refreshCallback != null) widget.refreshCallback();
                },
                icon: const Icon(Icons.refresh))
        ],
      ),
    );
  }
}
