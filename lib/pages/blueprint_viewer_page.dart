import 'dart:convert';
import 'package:custom_forms/widgets/placeholders/choiceBox.dart';
import 'package:flutter/material.dart';
import '/pages/blueprint_editor_v1.dart';
import '/widgets/placeholders/colbox.dart';
import '/widgets/placeholders/rowbox.dart';
import '/widgets/placeholders/textbox.dart';
import '/widgets/placeholders/imageBox.dart';

class BlueprintViewerPage extends StatefulWidget {
  const BlueprintViewerPage({super.key, required this.jsonString});
  final String jsonString;
  final String testString = '''
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
}''';

  @override
  State<BlueprintViewerPage> createState() => _BlueprintViewerPageState();
}

class _BlueprintViewerPageState extends State<BlueprintViewerPage> {
// ==========================================================================
// ==========================================================================
// ==========================================================================

  Widget buildWidget(dynamic data) {
    if (data is List) {
      return Column(
        children: data.map((item) => buildWidget(item)).toList(),
      );
    } else if (data is Map && data.containsKey('type')) {
      switch (data['type']) {
        case 'row':
          return RowBox(
            renderType: 2,
            children: (data['children'] as List)
                .map((item) => buildWidget(item))
                .toList(),
          );
        case 'column':
          return ColBox(
            renderType: 2,
            children: (data['children'] as List)
                .map((item) => buildWidget(item))
                .toList(),
          );
        case 'textBox':
          return TextBox(
            renderType: 1,
            hintText: data['hint'],
          );
        case 'choiceBox':
          return ChoiceBox(
            renderType: 1,
          );
        case 'imageBox':
          return ImageBox(
            renderType: 1,
          );
        // Add more cases for other widget types as needed
        default:
          return SizedBox(); // Return an empty widget if type is not recognized
      }
    } else {
      return SizedBox(); // Return an empty widget if data type is not recognized
    }
  }

// ==========================================================================
// ==========================================================================
// ==========================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Blueprint Viewer'),
        ),
        body: SingleChildScrollView(
          child: buildWidget(json.decode(widget.jsonString)),
        ));
  }
}
