import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/Common/form_background.dart';
import 'package:leads_in/Screens/Common/form_title.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../assets.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import '../../Common/background.dart';
import '../../screens.dart';

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
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Material(
      child: SlidingUpPanel(
        header: Container(
            width: size.width,
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.keyboard_arrow_up,
                size: 30,
              ),
            )),
        borderRadius: radius,
        panel: BottomSheet(_key, context),
        body: Scaffold(
          body: SetBody(_key, context),
        ),
      ),
    );
  }

  Widget RegisterCompanyButton() {
    return MaterialButton(
      height: 50.0,
      minWidth: 150.0,
      shape: buttonBorder,
      //minWidth: MediaQuery.of(context).size.width,
      color: PrimaryColor,
      textColor: Colors.white,
      padding: buttonPadding,
      onPressed: () {
        Navigator.of(context).push(_createRegisterCompanyRoute());
      },
      child: Text(
        "Register Company",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget BottomSheet(GlobalKey<ScaffoldState> globalKey, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.bottomCenter,
        width: size.width,
        height: size.height * 0.3,
        child: Wrap(
          children: [RegisterCompanyButton()],
        ));
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
                      left: size.width * 0.05,
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
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // return the header
                        return new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: RichText(
                                text: TextSpan(
                                  text: "Recent Updates",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 32.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700 // bold
                                      ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {},
                          // 6
                          child: Container(
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
                        );
                      }
                      // 5
                    }),
              ),
            ],
          )),
    );
  }

  final buttonPadding =
      new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0);

  final buttonBorder = new RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
    side: BorderSide(color: Colors.white, width: 0.0),
  );

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

  Route _createRegisterCompanyRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          AddCompanyScreenOne(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
