import 'package:flutter/material.dart';

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
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Container(
                      child: Text(
                        'CustomForm',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        child: TextField(
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.grey)),
                          hintText: 'Enter your Blueprint name'),
                    )),
                    Container(
                      child: Row(children: []),
                    )
                  ]),
                ),
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
