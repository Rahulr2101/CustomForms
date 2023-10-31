import 'dart:developer';

import 'package:flutter/material.dart';

class ContainerBox extends StatefulWidget {
  ContainerBox({
    super.key,
    this.renderType = -1,
    Widget? childwidget,
  });
  final int renderType;
  Widget? childwidget;

  @override
  State<ContainerBox> createState() => _ColBoxState();
}

class _ColBoxState extends State<ContainerBox> {
  @override
  Widget build(BuildContext context) {
    if (widget.renderType == 0) {
      return Draggable(
        data: ContainerBox(renderType: 1),
        feedback: ContainerBox(renderType: -1),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(4.0),
                  child: SizedBox(
                      height: 80,
                      width: 100,
                      child: Image.asset('lib/assets/Container.png'))),
              Text(
                'Container',
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
          widget.childwidget = data;
        }),
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xFFA3A7BA).withOpacity(0.05),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Container(
                    child: widget.childwidget == null
                        ? Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Center(
                              child: Text(
                                'Container Box Placeholder',
                                style: TextStyle(
                                    color: const Color(0xFFA3A7BA)
                                        .withOpacity(0.8)),
                              ),
                            ),
                          )
                        : widget.childwidget)),
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
        child: Center(child: Container(child: widget.childwidget)),
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
                    child: Image.asset('lib/assets/Container.png'))),
            Text(
              'Cotainer',
              style: TextStyle(color: Color(0xFFA3A7BA)),
            )
          ],
        ),
      ),
    );
  }
}
