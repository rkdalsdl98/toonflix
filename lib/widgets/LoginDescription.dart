import 'dart:async';

import 'package:flutter/material.dart';

class LoginDescription extends StatefulWidget {
  final String description;
  final int showTextDuration;
  bool showText = false;

  LoginDescription({
    super.key,
    required this.description,
    this.showTextDuration = 500,
  });

  @override
  State<LoginDescription> createState() => _LoginDescriptionState();
}

class _LoginDescriptionState extends State<LoginDescription> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(
          milliseconds: widget.showTextDuration,
        ), () {
      widget.showText = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedOpacity(
        opacity: widget.showText ? 1 : 0,
        duration: const Duration(
          milliseconds: 500,
        ),
        child: Text(
          widget.description,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
