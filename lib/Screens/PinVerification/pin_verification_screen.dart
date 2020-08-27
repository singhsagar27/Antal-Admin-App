import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component/body.dart';



class PinVerificationScreen extends StatefulWidget{

  @override
  _PinVerificationScreenState createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}