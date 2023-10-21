import 'package:flutter/material.dart';

class ColBox extends StatefulWidget {
  const ColBox({super.key});

  @override
  State<ColBox> createState() => _ColBoxState();
}

class _ColBoxState extends State<ColBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
    );
  }
}
