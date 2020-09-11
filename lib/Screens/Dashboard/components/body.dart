import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/screens.dart';
import 'package:leads_in/assets.dart';
import 'package:leads_in/widgets/CustomAppBar.dart';
import 'package:leads_in/widgets/RaisedGradientButton.dart';
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
  GlobalKey<ScaffoldState> _key = new GlobalKey();
  final myController = TextEditingController();
  PanelController _pc = new PanelController();
  bool _isDrawerOpen = false;
  bool _isSlidingUppanelOpen = false;

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
        controller: _pc,
        minHeight: size.height * 0.25,
        maxHeight: size.height * 0.70,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.black,
          )
        ],
        backdropTapClosesPanel: true,
        borderRadius: radius,
        isDraggable: false,
        panel: BottomSheet(_key, context),
        body: Scaffold(
          key: _key,
          appBar: Appbar(context),
          body: SetBody(_key, context),
          endDrawer: CustomDrawer(
            callback: (isOpen) {
              print("isOpen ${isOpen}");
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  _isDrawerOpen = isOpen;
                });
              });

              if (isOpen) {
                _pc.hide();
                _isSlidingUppanelOpen = false;
              } else {
                _pc.show();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget Appbar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomAppBar(
      height: 120,
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
                  radius: 27,
                  backgroundColor: Colors.transparent,
                  borderWidth: 0,
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
                    text: TextSpan(text: "Bob Jr", style: bold),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        _key.currentState.openEndDrawer();
                        //Scaffold.of(context).openEndDrawer();

                        print("Open Drawer");
                      },
                      icon: Image.asset(
                        Assets.profileMenu,
                        width: 30,
                        height: 30,
                      ),
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
    Size size = MediaQuery.of(context).size;
    return RaisedGradientButton(
      height: 48.0,
      width: size.width * 0.8,
      gradient: LinearGradient(
        colors: [
          MainColorLight,
          MainColor,
        ],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
      ),
      //minWidth: MediaQuery.of(context).size.width,

      onPressed: () {
        Navigator.of(context).push(_createRegisterCompanyRoute());
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              Assets.bank,
              width: 30,
              height: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: size.width * 0.03,
          ),
          Text(
            "Register Company",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget BottomSheet(GlobalKey<ScaffoldState> globalKey, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size.width,
            child: Align(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {
                  !_pc.isPanelOpen
                      ? setState(() {
                          _pc.open();
                          _isSlidingUppanelOpen = true;
                        })
                      : setState(() {
                          _pc.close();
                          _isSlidingUppanelOpen = false;
                        });
                },
                icon: _isSlidingUppanelOpen
                    ? new Icon(Icons.keyboard_arrow_down)
                    : new Icon(Icons.keyboard_arrow_up),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: RichText(
              text: TextSpan(
                text: "View",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                    color: MainColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
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
                        SheetIconViews(context, "Connected Companies",
                            Assets.files, Colors.blue[50]),
                        SheetIconViews(context, "Sales Partner",
                            Assets.briefcase, Colors.blue[50]),
                        SheetIconViews(context, "Accounts Person",
                            Assets.cardSwipe, Colors.blue[50]),
                        SheetIconViews(context, "Revenue Generated",
                            Assets.iconPie, Colors.blue[50]),
                      ],
                    ),
                  ),
                  Divider(
                    height: size.height * 0.01,
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
                        SheetIcon(context, "Track Lead", Assets.iconTrackLead,
                            Colors.white),
                        SheetIcon(context, "Add Lead", Assets.attachment,
                            Colors.white),
                        SheetIcon(context, "Assign Lead", Assets.iconLink,
                            Colors.white),
                      ],
                    ),
                  ),
                  Divider(
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: RichText(
                      text: TextSpan(
                        text: "Add",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18.0,
                            color: MainColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
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
                        SheetIcon(context, "Recruiter", Assets.iconRecruiter,
                            Colors.white),
                        SheetIcon(context, "Sales Partner",
                            Assets.iconSalesPartner, Colors.white),
                        SheetIcon(context, "Accounts Person",
                            Assets.addressBook, Colors.white),
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
      ),
    );
  }

  Widget SheetIcon(
      BuildContext context, String title, String assetName, Color back) {
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
            width: size.width * 0.13,
            height: size.width * 0.13,
            decoration: BoxDecoration(
              color: back,
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
                    width: size.width * 0.07,
                    height: size.width * 0.07,
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(MainColor, BlendMode.dst),
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
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Widget SheetIconViews(
      BuildContext context, String title, String assetName, Color back) {
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
            width: size.width * 0.13,
            height: size.width * 0.13,
            decoration: BoxDecoration(
              color: back,
              borderRadius: BorderRadius.circular(100),
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
                    width: size.width * 0.07,
                    height: size.width * 0.07,
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(MainColor, BlendMode.dst),
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
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
          ),
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
                  itemCount: 2,
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
                                    fontSize: 30.0,
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
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      width: size.width * 0.13,
                                      height: size.width * 0.13,
                                      child: Image.asset(
                                        Assets.dashboard,
                                        width: size.width * 0.07,
                                        height: size.width * 0.07,
                                        color: Colors.white,
                                      ),
                                    ), // no matter how big it is, it won't overflow

                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: RichText(
                                        text: TextSpan(
                                          text: "Lead Closure Update",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 15.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                alignment: Alignment.centerLeft,
                                child: Flexible(
                                  child: RichText(
                                    text: TextSpan(
                                      text:
                                          "Lead Closure update related summery and other relevent data",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 13.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.grey[100],
                                height: size.height * 0.02,
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
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

  gotoScreen(String name) {
    switch (name) {
      case "Connected Companies":
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

class CustomDrawer extends StatefulWidget {
  CustomDrawer({
    Key key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
    this.callback,
  })  : assert(elevation != null && elevation >= 0.0),
        super(key: key);

  final double elevation;
  final Widget child;
  final String semanticLabel;

  final DrawerCallback callback;
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  void initState() {
    if (widget.callback != null) {
      widget.callback(true);
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.callback != null) {
      widget.callback(false);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        key: widget.key,
        elevation: widget.elevation,
        semanticLabel: widget.semanticLabel,
        child: widget.child);
  }
}
