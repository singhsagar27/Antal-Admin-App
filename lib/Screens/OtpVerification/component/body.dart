import 'package:flutter/material.dart';
import 'package:leads_in/Screens/Common/form_background.dart';
import 'package:leads_in/Screens/Common/form_title.dart';

import '../../Common/background.dart';

import 'OtpVerificationForm.dart';

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
          FormTitle(
            title: "Verification",
            messege: "Enter Verification Code Sent to Your Phone",
          ),
          FormBackground(
            child: OtpVerificationForm(),
          )
        ],
      ),
    );
  }
}
