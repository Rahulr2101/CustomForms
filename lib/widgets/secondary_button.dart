import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String hint;
  const SecondaryButton({required this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: Text(
            hint,
            style: const TextStyle(color: Colors.white),
          ),
          onPressed: () => {},
        ));
    ;
  }
}
