import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:leads_in/Screens/Common/form_background.dart';
import 'package:leads_in/Screens/Common/form_title.dart';
import 'package:leads_in/assets.dart';
import 'EnterPinForm.dart';

import '../../Common/background.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: <Widget>[
          CircularProfileAvatar(
            '',
            child: Image.asset(
              Assets.profile,
              fit: BoxFit.cover,
            ),
            radius: 27,
            backgroundColor: Colors.transparent,
            borderWidth: 0,
            borderColor: Colors.transparent,
            elevation: 5.0,
            foregroundColor: Colors.brown.withOpacity(0.5),
            cacheImage: true,
            onTap: () {
              print("Profile");
            },
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(text: "Hey, Name", style: smallBold),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(text: "Guten Tag!", style: bigBold),
            ),
          ),
          EnterPin(),
        ],
      ),
    );
  }

  final bigBold = new TextStyle(
      fontFamily: 'Poppins',
      fontSize: 32.0,
      color: Colors.white,
      fontWeight: FontWeight.w700 // bold
      );
  final smallBold = new TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16.0,
      color: Colors.white,
      fontWeight: FontWeight.w500 // medium
      );
}
