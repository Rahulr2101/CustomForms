import 'package:flutter/material.dart';
import '/pages/blueprint_editor_v1.dart';
import '/widgets/button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Button(
            text: 'Blueprint Editor v1',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BluePrintEditorv1Page(),
                  ));
            },
          ),
        ),
      ),
    );
  }
}
