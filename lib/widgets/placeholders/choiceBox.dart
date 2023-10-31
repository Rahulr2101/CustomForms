import 'package:flutter/material.dart';
import '/widgets/button.dart';
import '/widgets/icon_textinput_field.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceBox extends StatefulWidget {
  ChoiceBox({super.key, this.renderType = 0});
  final int renderType;

  @override
  State<ChoiceBox> createState() => _ChoiceBoxState();
}

class _ChoiceBoxState extends State<ChoiceBox> {
  @override
  Widget build(BuildContext context) {
    if (widget.renderType == 0) {
      return Draggable(
        data: ChoiceBox(renderType: 1),
        feedback: ChoiceBox(renderType: 2),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(4.0),
                  child: SizedBox(
                      height: 80,
                      width: 100,
                      child: Image.asset('lib/assets/Choice_Input_Box.png'))),
              Text(
                'Choice Input',
                style: TextStyle(color: Color(0xFFA3A7BA)),
              )
            ],
          ),
        ),
      );
    }

    if (widget.renderType == 1) {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              width: 1.5,
              color: const Color(0xFFE7E8ED),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: const Color(0xFFA3A7BA),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Add Choice',
                  style: GoogleFonts.fredoka(
                    color: const Color(0xFFA3A7BA),
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ));
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
                    child: Image.asset('lib/assets/Choice_Input_Box.png'))),
            Text(
              'Choice Input',
              style: TextStyle(color: Color(0xFFA3A7BA)),
            )
          ],
        ),
      ),
    );
  }
}
