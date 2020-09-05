import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CompanyList();
  }
}

class CompanyList extends StatefulWidget {
  CompanyList({
    Key key,
  }) : super(key: key);

  @override
  CompanyListState createState() {
    return CompanyListState();
  }
}

class CompanyListState extends State<CompanyList> {
  GlobalKey<ScaffoldState> _key;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold();
  }
}
