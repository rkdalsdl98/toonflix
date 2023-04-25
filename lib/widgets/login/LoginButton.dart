import 'package:flutter/material.dart';
import 'package:toonflix/screens/homescreen.dart';
import 'dart:async';

import '../../globalfuncs/Desigh.dart';

class LoginButton extends StatefulWidget {
  final Color bgColor;
  final String buttonText;
  final Color shadowColor;
  final Offset shadowOffset;
  final Color buttonTextColor;
  final String identifier;
  final int showButtonDuration;
  final void Function(String) onChangePage;
  bool showButton = false;

  LoginButton({
    super.key,
    required this.bgColor,
    required this.buttonText,
    this.shadowColor = Colors.black,
    this.shadowOffset = const Offset(5, 5),
    this.buttonTextColor = Colors.white,
    required this.identifier,
    this.showButtonDuration = 500,
    required this.onChangePage,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  onPressButton() {
    if (widget.showButton) {
      WidgetBuilder builder = guest(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: builder,
        ),
      );
    }
  }

  WidgetBuilder guest(BuildContext context) {
    return (context) => HomeScreen(
          identifier: widget.identifier,
        );
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(
          milliseconds: widget.showButtonDuration,
        ), () {
      widget.showButton = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.showButton ? 1 : 0,
      duration: const Duration(
        milliseconds: 1000,
      ),
      child: GestureDetector(
        onTap: () => widget.onChangePage(widget.identifier),
        child: Container(
          height: 80 * scaleWidth(context),
          width: 400 * scaleWidth(context),
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: widget.shadowColor.withOpacity(.35),
                  blurRadius: 5,
                  offset: widget.shadowOffset),
            ],
          ),
          child: Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: widget.buttonTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
