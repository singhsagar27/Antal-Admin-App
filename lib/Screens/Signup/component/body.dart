import 'package:flutter/material.dart';
import 'package:leads_in/Screens/Common/form_background.dart';
import 'package:leads_in/Screens/Common/form_title.dart';
import 'package:leads_in/Screens/Signup/component/SignUpForm.dart';


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
            title: "Sign Up",
            messege: "please fill the following",
          ),
          FormBackground(
            child: SignUpForm(),
          )
        ],
      ),
    );
  }
}
