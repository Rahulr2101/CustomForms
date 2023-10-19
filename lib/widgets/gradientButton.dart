import 'package:flutter/material.dart';
import 'constant.dart';

class GradientButton extends StatelessWidget {
  final String buttonText;
  final double buttonWidth;
  final VoidCallback onTap;

  const GradientButton(
      {required this.buttonText,
      required this.buttonWidth,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(colors: [PrimaryColor, SecondaryColor])),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          buttonText, // Use the buttonText field here
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
    ;
  }
}
