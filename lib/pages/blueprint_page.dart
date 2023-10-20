import 'package:custom_forms/widgets/gradientButton.dart';
import 'package:flutter/material.dart';
import '../widgets/secondary_button.dart';
import '../widgets/Input.dart';

class Blueprint extends StatefulWidget {
  const Blueprint({super.key});

  @override
  State<Blueprint> createState() => _BlueprintState();
}

class _BlueprintState extends State<Blueprint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  const Text(
                    'CustomForm',
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Input(hint: 'Enter your blueprint name'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(children: [
                      Expanded(
                        flex: 1,
                        child: GradientButton(
                            buttonText: 'Save',
                            buttonWidth: double.infinity,
                            onTap: () => {}),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          flex: 2,
                          child: SecondaryButton(hint: 'Preview the form'))
                    ]),
                  )
                ]),
              )),
          Expanded(
            flex: 5,
            child: Container(),
          )
        ],
      )),
    );
  }
}
