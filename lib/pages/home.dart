import 'package:flutter/material.dart';
import '../widgets/gradientButton.dart';
import 'blueprint_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GradientButton(
          buttonText: 'CustomForms v1',
          buttonWidth: 450,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Blueprint())),
        ),
      ),
    );
  }
}
