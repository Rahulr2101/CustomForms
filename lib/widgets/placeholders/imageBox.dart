import 'package:flutter/material.dart';
import '/widgets/button.dart';
import '/widgets/icon_textinput_field.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageBox extends StatefulWidget {
  ImageBox({
    super.key,
    this.renderType = 0,
  });
  final int renderType;

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (widget.renderType == 0) {
      return Draggable(
        data: ImageBox(renderType: 1),
        feedback: ImageBox(renderType: 2),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(4.0),
                  child: SizedBox(
                      height: 80,
                      width: 100,
                      child: Image.asset('lib/assets/Input_Image_Box.png'))),
              Text(
                'Image Input',
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
                  'Add Image',
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
                    child: Image.asset('lib/assets/Input_Image_Box.png'))),
            Text(
              'Image Input',
              style: TextStyle(color: Color(0xFFA3A7BA)),
            )
          ],
        ),
      ),
    );
  }
}
