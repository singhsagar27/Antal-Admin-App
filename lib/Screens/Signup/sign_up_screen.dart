import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component/body.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Body(),
    );
  }
}
