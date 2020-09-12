import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component/body.dart';



class PinLoginScreen extends StatefulWidget{

  @override
  _PinLoginScreenState createState() => _PinLoginScreenState();
}

class _PinLoginScreenState extends State<PinLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}