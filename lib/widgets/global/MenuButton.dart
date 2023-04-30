import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toonflix/globalfuncs/Desigh.dart';

class MenuButton extends StatefulWidget {
  final String menuTitle;
  final IconData menuIcon;
  final Color iconColor;

  const MenuButton({
    super.key,
    required this.menuIcon,
    required this.menuTitle,
    required this.iconColor,
  });

  @override
  State<MenuButton> createState() => _MenuButtonButtonState();
}

class _MenuButtonButtonState extends State<MenuButton> {
  double buttonTranslateY = -10;
  double turns = 0.0;

  void onChangeRotation() {
    setState(() => turns += 1.0 / 4.0);
  }

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
      child: GestureDetector(
        onTap: onChangeRotation,
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
          child: Row(
            children: [
              SizedBox(
                width: 250 * scaleWidth(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 104 * scaleWidth(context),
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 100),
                  turns: turns,
                  child: const Icon(
                    Icons.add,
                    size: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
