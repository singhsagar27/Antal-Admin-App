import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/screens.dart';
import 'package:leads_in/assets.dart';
import 'package:leads_in/widgets/CustomAppBar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
        minHeight: size.height * 0.25,
        maxHeight: size.height * 0.70,
        snapPoint: 0.45,
        backdropTapClosesPanel: false,
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
          appBar: Appbar(context),
          body: SetBody(_key, context),
        ),
      ),
    );
  }

  Widget Appbar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomAppBar(
      height: 130,
      child: SafeArea(
        child: Container(
          child: Padding(
            padding:
                new EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Row(
              children: <Widget>[
                CircularProfileAvatar(
                  '',
                  child: Image.asset(
                    Assets.profile,
                    fit: BoxFit.cover,
                  ),
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  borderWidth: 0,
                  initialsText: Text(
                    "AD",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  borderColor: Colors.transparent,
                  elevation: 2.0,
                  foregroundColor: Colors.brown.withOpacity(0.5),
                  cacheImage: true,
                  onTap: () {
                    gotoScreen("Profile");
                  },
                ),
                SizedBox(width: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(text: "My Name", style: bold),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      Assets.profileMenu,
                      width: 36,
                      height: 36,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.04),
      child: Container(
          alignment: Alignment.topCenter,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: RichText(
                  text: TextSpan(
                    text: "Add",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.05, right: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SheetIcon(context, "Company", Assets.bank),
                            SheetIcon(context, "Recruiter", Assets.bank),
                            SheetIcon(context, "Sales Partner", Assets.bank),
                            SheetIcon(context, "Accounts Person", Assets.bank),
                          ],
                        ),
                      ),
                      Divider(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.05, right: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SheetIcon(context, "Track Lead", Assets.bank),
                            SheetIcon(context, "Add Lead", Assets.bank),
                            SheetIcon(context, "Assign Lead", Assets.bank),
                          ],
                        ),
                      ),
                      Divider(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: RichText(
                          text: TextSpan(
                            text: "View",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.05, right: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SheetIcon(
                                context, "Connected Companies", Assets.bank),
                            SheetIcon(context, "Sales Partner", Assets.bank),
                            SheetIcon(context, "Accounts Person", Assets.bank),
                            SheetIcon(
                                context, "Revenue Generated", Assets.bank),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      RegisterCompanyButton(),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget SheetIcon(BuildContext context, String title, String assetName) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.20,
      height: size.width * 0.27,
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: size.width * 0.15,
            height: size.width * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Material(
              clipBehavior: Clip.hardEdge,
              shape: CircleBorder(),
              color: Colors.transparent,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                    image: AssetImage(assetName),
                    width: size.width * 0.09,
                    height: size.width * 0.09,
                    fit: BoxFit.contain,
                  ),
                  InkWell(
                    onTap: () {
                      gotoScreen(title);
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.25),
                  child: ListView.builder(
                      itemCount: 10 + 1,
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
                        }
                        index -= 1;
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: ListTile(
                              title: RichText(
                                  text: TextSpan(
                                text: "title $index",
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

                        // 5
                      }),
                ),
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

  gotoScreen(String name) {
    switch (name) {
      case "Recruiter":
        {
          // statements;
          Navigator.of(context).push(_createRoute(AddRecruiterScreenOne()));
        }
        break;

      case "Company":
        {
          //statements;
          Navigator.of(context).push(_createRoute(CompanyListScreen()));
        }
        break;
      case "Profile":
        {
          //statements;
          Navigator.of(context).push(_createRoute(ProfileScreen()));
        }
        break;
    }
  }

  Route _createRoute(Widget Screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Screen,
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
