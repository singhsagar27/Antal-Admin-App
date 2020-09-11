import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class FPOtpVerificationScreen extends StatefulWidget {
  @override
  _FPOtpVerificationScreenState createState() =>
      _FPOtpVerificationScreenState();
}

class _FPOtpVerificationScreenState extends State<FPOtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
