import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String hint;
  const Input({required this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          hintText: hint),
    );
  }
}
