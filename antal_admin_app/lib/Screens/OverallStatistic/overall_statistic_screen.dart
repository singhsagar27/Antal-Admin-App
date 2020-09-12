import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component/body.dart';



class OverallStatisticScreen extends StatefulWidget{

  @override
  _OverallStatisticScreenState createState() => _OverallStatisticScreenState();
}

class _OverallStatisticScreenState extends State<OverallStatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}