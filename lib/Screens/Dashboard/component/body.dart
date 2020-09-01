import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/Common/form_background.dart';
import 'package:leads_in/Screens/Common/form_title.dart';
import '../../../assets.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import '../../Common/background.dart';

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
      endDrawer: buildProfileDrawer(),
      body: SetBody(_key, context),
    );
  }

  //custom widget
  Widget SetBody(GlobalKey<ScaffoldState> globalKey, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
          width: size.width,
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: new EdgeInsets.only(
                      left: size.width * 0.10,
                      right: size.width * 0.05,
                      top: size.width * 0.05,
                      bottom: size.width * 0.05),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage(Assets.profile),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(width: 20),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: RichText(
                          text: TextSpan(text: "title", style: bold),
                        ),
                      ),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              Assets.profileMenu,
                              width: 36,
                              height: 36,
                            )),
                      ),
                    ],
                  ),
                ),
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
              ),
              FormBackground(
                child: Container(
                  width: size.width,
                  height: size.height * 0.3,
                  child: Text("Hoooo"),
                ),
              ),
            ],
          )),
    );
  }

  final bold = new TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18.0,
      color: Colors.white,
      fontWeight: FontWeight.w500 // bold
      );

  //Custom drawer
  buildProfileDrawer() {
    return Drawer();
  }
}
