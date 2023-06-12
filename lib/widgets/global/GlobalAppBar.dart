import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/System.dart';

class GlobalAppBar extends StatefulWidget {
  final bool centerTitle;
  final bool showRefreshButtion;
  final bool translateBackground;

  dynamic refreshCallback;
  String? titleText;
  bool showDefaultLeading;

  GlobalAppBar({
    super.key,
    required this.centerTitle,
    this.titleText,
    required this.showRefreshButtion,
    this.refreshCallback,
    this.showDefaultLeading = false,
    this.translateBackground = false,
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
        automaticallyImplyLeading: widget.showDefaultLeading,
        title: widget.titleText != null
            ? Text(widget.titleText!)
            : Image.asset(
                'assets/icons/toonflixlogo_translucent.png',
                width: 48,
                height: 48,
              ),
        backgroundColor: widget.translateBackground
            ? Colors.transparent
            : Theme.of(context).colorScheme.background,
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
