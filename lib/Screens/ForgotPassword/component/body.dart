import 'package:flutter/material.dart';
import 'package:leads_in/Screens/Common/form_background.dart';
import 'package:leads_in/Screens/Common/form_title.dart';
import 'ForgotPasswordForm.dart';

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
          FormTitle(
            title: "Forgot Password",
            messege: "Please Enter Following",
          ),
          FormBackground(
            child: ForgotPasswordForm(),
          )
        ],
      ),
    );
  }
}
