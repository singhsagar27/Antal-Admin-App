import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component/body.dart';



class OtpVerificationScreen extends StatefulWidget{

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}