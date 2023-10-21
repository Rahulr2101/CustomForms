import 'dart:developer';
import 'package:flutter/material.dart';

class RowBox extends StatefulWidget {
  RowBox({super.key, this.renderType = 0, this.children = const []});
  final int renderType;
  List<Widget> children;

  @override
  State<RowBox> createState() => _RowBoxState();
}

class _RowBoxState extends State<RowBox> {
  List<Widget> rowChildren = [];
  @override
  Widget build(BuildContext context) {
    if (widget.renderType == 0) {
      return Draggable(
        data: RowBox(renderType: 1),
        feedback: RowBox(renderType: -1),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(4.0),
                  child: SizedBox(
                      height: 80,
                      width: 100,
                      child: Image.asset('lib/assets/Row_Box.png'))),
              Text(
                'Row',
                style: TextStyle(color: Color(0xFFA3A7BA)),
              )
            ],
          ),
        ),
      );
    }

    if (widget.renderType == 1) {
      return DragTarget<Widget>(
        onAccept: (data) => setState(() {
          rowChildren.add(data);
          widget.children = rowChildren;
          log(rowChildren.toString());
        }),
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return Container(
            // height: 50,
            // width: 220,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xFFA3A7BA).withOpacity(0.05),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: rowChildren.isEmpty
                    ? [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            'RowBox Placeholder',
                            style: TextStyle(
                                color:
                                    const Color(0xFFA3A7BA).withOpacity(0.8)),
                          ),
                        ),
                      ]
                    : rowChildren.map((e) => Flexible(child: e)).toList(),
              ),
            ),
          );
        },
      );
    }

    if (widget.renderType == 2) {
      return Container(
        // height: 50,
        // width: 220,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color(0xFFA3A7BA).withOpacity(0.05),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.children.isEmpty
                ? [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'RowBox Placeholder',
                        style: TextStyle(
                            color: const Color(0xFFA3A7BA).withOpacity(0.8)),
                      ),
                    ),
                  ]
                : widget.children.map((e) => Flexible(child: e)).toList(),
          ),
        ),
      );
    }
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 80,
                    width: 100,
                    child: Image.asset('lib/assets/Row_Box.png'))),
            Text(
              'Row',
              style: TextStyle(color: Color(0xFFA3A7BA)),
            )
          ],
        ),
      ),
    );
  }
}
