import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CompanyProfile();
  }
}

class CompanyProfile extends StatefulWidget {
  CompanyProfile({
    Key key,
  }) : super(key: key);

  @override
  CompanyProfileState createState() {
    return CompanyProfileState();
  }
}

class CompanyProfileState extends State<CompanyProfile> {
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
