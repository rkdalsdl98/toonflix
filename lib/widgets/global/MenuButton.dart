import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';

class MenuButton extends StatefulWidget {
  final String menuTitle;
  final IconData menuIcon;
  final Color iconColor;
  final Function() callback;

  const MenuButton({
    super.key,
    required this.menuIcon,
    required this.menuTitle,
    required this.iconColor,
    required this.callback,
  });

  @override
  State<MenuButton> createState() => _MenuButtonButtonState();
}

class _MenuButtonButtonState extends State<MenuButton> {
  double buttonTranslateY = -10;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1), () {
      setState(() {
        buttonTranslateY = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: AnimatedContainer(
        width: double.maxFinite,
        height: 50 * scaleHeight(context),
        duration: const Duration(
          milliseconds: 150,
        ),
        transform: Matrix4(
          1, // scale X
          0, // rotate Y
          0,
          0,
          0, // rotate X
          1, // scale Y
          0,
          0,
          0,
          0,
          1,
          0,
          0, // translate X
          buttonTranslateY, // translate Y
          0,
          1,
        ),
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                widget.menuIcon,
                color: widget.iconColor,
                size: 30 * scaleWidth(context),
                shadows: [
                  Shadow(
                    offset: const Offset(0, 0),
                    blurRadius: 10,
                    color: widget.iconColor.withOpacity(.4),
                  )
                ],
              ),
              Text(
                widget.menuTitle,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              InkWell(
                onTap: widget.callback,
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
