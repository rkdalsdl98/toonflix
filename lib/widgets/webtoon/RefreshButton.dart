import 'package:flutter/material.dart';

class RefreshButton extends StatefulWidget {
  Future<void> actionCallback;

  RefreshButton({super.key, required this.actionCallback});

  @override
  State<RefreshButton> createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: IconButton(
          icon: const Icon(Icons.refresh_outlined),
          onPressed: () {},
        ),
      ),
    );
  }
}
