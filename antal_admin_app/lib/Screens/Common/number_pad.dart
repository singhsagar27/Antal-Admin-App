import 'package:flutter/material.dart';
import 'package:leads_in/assets.dart';

import '../../Palette.dart';

class NumberPad extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final Function onPressed;
  final Color color, textColor, borderColor;

  NumberPad({
    Key key,
    this.text,
    this.width,
    this.height,
    this.fontSize,
    this.onPressed,
    this.color = PrimaryColor,
    this.textColor = Colors.white,
    this.borderColor = PrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(4.0),
        child: new SizedBox(
            height: height,
            width: width,
            child: MaterialButton(
              onPressed: onPressed,
              elevation: 2.0,
              color: color,
              padding: EdgeInsets.all(5.0),
              shape: CircleBorder(
                side: BorderSide(color: borderColor, width: 1.0),
              ),
              child: Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300),
              ),
            )));
  }

  final bold = new TextStyle(
      fontFamily: 'Poppins',
      fontSize: 32.0,
      color: Colors.white,
      fontWeight: FontWeight.w700 // bold
      );
  final light = new TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0,
      color: Colors.white,
      fontWeight: FontWeight.w300 // medium
      );
}
