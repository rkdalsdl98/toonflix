import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  bool? enabled;
  bool? obscureText;

  InputField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.controller,
      this.enabled,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 30,
      ),
      child: TextField(
        obscureText: obscureText ?? false,
        enabled: enabled ?? true,
        controller: controller,
        style: const TextStyle(
          fontSize: 10,
        ),
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            labelText: labelText,
            hintText: hintText),
      ),
    );
  }
}
