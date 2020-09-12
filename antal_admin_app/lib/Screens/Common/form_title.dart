import 'package:flutter/material.dart';
import 'package:leads_in/assets.dart';

class FormTitle extends StatelessWidget {
  final String title;
  final String messege;

  FormTitle({
    Key key,
    @required this.title,
    this.messege,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: new EdgeInsets.only(
            left: size.width * 0.10, right: size.width * 0.10),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(text: title, style: bold),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(text: messege, style: light),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
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
