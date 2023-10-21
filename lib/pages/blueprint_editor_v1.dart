import 'dart:convert';

import 'package:flutter/material.dart';
import '/pages/blueprint_viewer_page.dart';
import '/widgets/button.dart';
import '/widgets/icon_textinput_field.dart';
import '/widgets/placeholders/colbox.dart';
import '/widgets/placeholders/rowbox.dart';
import '/widgets/placeholders/textbox.dart';
import '/widgets/viewport_v1.dart';
import 'package:google_fonts/google_fonts.dart';

// A class to represent a widget node in the JSON structure
class WidgetNode {
  final String type;
  final List<WidgetNode> children;
  final String hint;
  final String id;

  WidgetNode({
    required this.type,
    this.children = const [],
    this.hint = '',
    this.id = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      "type": type,
      "children": children.map((child) => child.toJson()).toList(),
      "hint": hint,
      "id": id,
    };
    return json;
  }
}

class BluePrintEditorv1Page extends StatefulWidget {
  const BluePrintEditorv1Page({super.key});

  @override
  State<BluePrintEditorv1Page> createState() => _BluePrintEditorv1PageState();
}

var yourJsonString = '''
{
  "type": "row",
  "children": [
    {
      "type": "column", 
      "children": [
        {"type": "widget", "hint": "Nested 111", "id": "nested1"},
        {"type": "widget", "hint": "Nested 222", "id": "nested2"}
      ]
    },
   
    {
      "type": "column",
      "children": [
        {"type": "widget", "hint": "Nested 333",  "id": "nested3"},
        {"type": "row", "children":[
          {"type": "widget", "hint": "Nested 444", "id": "nested4"},
          {"type": "widget", "hint": "Nested 555", "id": "nested5"}
        ]}
      ]
    }
  ]
}
''';
TextEditingController jsonStringController = TextEditingController();

class _BluePrintEditorv1PageState extends State<BluePrintEditorv1Page> {
  WidgetNode serializeWidgetToNode(Widget widget) {
    if (widget is RowBox) {
      final List<WidgetNode> childrenNodes =
          widget.children.map((child) => serializeWidgetToNode(child)).toList();
      return WidgetNode(type: 'row', children: childrenNodes);
    } else if (widget is ListView) {
      final List<WidgetNode> childrenNodes =
          acceptedData.map((child) => serializeWidgetToNode(child)).toList();
      return WidgetNode(type: 'column', children: childrenNodes);
    } else if (widget is ColBox) {
      final List<WidgetNode> childrenNodes =
          widget.children.map((child) => serializeWidgetToNode(child)).toList();
      return WidgetNode(type: 'column', children: childrenNodes);
    } else if (widget is TextBox) {
      return WidgetNode(type: 'textBox', hint: widget.hintText);
    }
    // You can add more conditions for other widgets as needed

    // If the widget doesn't match any known types, return an empty node
    return WidgetNode(type: 'empty');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Text(
                        'Blueprint Editor',
                        style: GoogleFonts.fredoka(
                            color: const Color(0xFF272727),
                            fontSize: 30,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                    IconTextInputField(
                      hintText: 'Enter your blueprint name',
                      controller: TextEditingController(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 5),
                      child: Row(
                        children: [
                          Flexible(
                            child: Button(
                              text: 'Save',
                              onTap: () {
                                setState(() {
                                  serializeWidgetToNode(layout);
                                  final serializedLayout =
                                      serializeWidgetToNode(layout);

                                  // Convert the JSON structure to a JSON string
                                  final jsonLayout = serializedLayout.toJson();
                                  final jsonString = jsonEncode(jsonLayout);

                                  // Print the JSON string
                                  // print(jsonString);
                                  setState(() {
                                    yourJsonString = jsonString;
                                  });
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 2,
                            child: Button(
                              text: 'Preview the Blueprint',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlueprintViewerPage(
                                        jsonString: yourJsonString),
                                  ),
                                );
                              },
                              primary: false,
                            ),
                          )
                        ],
                      ),
                    ),
                    // MultiTextInputField(
                    //   controller: jsonStringController,
                    // )
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFF7F7F7),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Layouts',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextBox(
                                      renderType: 0,
                                    ),
                                    RowBox(
                                      renderType: 0,
                                    ),
                                    ColBox(
                                      renderType: 0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 12,
              child: ViewportV1(
                data: yourJsonString,
              )),
        ],
      ),
    );
  }
}
