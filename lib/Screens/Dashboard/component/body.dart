import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/Common/form_background.dart';
import 'package:leads_in/Screens/Common/form_title.dart';
import '../../../assets.dart';

import '../../Common/background.dart';
import 'dashboard_head.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dashboard();
  }
}

class Dashboard extends StatefulWidget {
  Dashboard({
    Key key,
  }) : super(key: key);

  @override
  DashboardState createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> _key;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: setAppBar(_key, context),
    );
  }

  //custom widget
  Widget setAppBar(GlobalKey<ScaffoldState> globalKey, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
          width: size.width,
          child: Column(
            children: <Widget>[
              DashboardHead(
                title: "Hey, There",
                profile: Assets.profile,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        // 5
                        return GestureDetector(
                          onTap: () {},
                          // 6
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              // 7
                              child: ListTile(
                                title: RichText(
                                    text: TextSpan(
                                  text: "title",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )),
                                subtitle: RichText(
                                    text: TextSpan(
                                  text: "Messssage",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )),
                                leading: Image.asset(
                                  Assets.profile,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          )),
    );
  }
}
