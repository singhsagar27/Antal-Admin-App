import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OverallStatistic();
  }
}

class OverallStatistic extends StatefulWidget {
  OverallStatistic({
    Key key,
  }) : super(key: key);

  @override
  OverallStatisticState createState() {
    return OverallStatisticState();
  }
}

class OverallStatisticState extends State<OverallStatistic> {
  GlobalKey<ScaffoldState> _key;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material();
  }
}
