import 'package:flutter/material.dart';
import 'package:leads_in/assets.dart';

class DashboardHead extends StatelessWidget {
  final String title;
  final String profile;
  Widget child;

  DashboardHead({
    Key key,
    @required this.title,
    this.profile,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: buildProfileDrawer(),
      body: Container(
        width: size.width,
        height: size.height,
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
                backgroundImage: AssetImage(profile),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(width: 20),
              Align(
                alignment: Alignment.bottomLeft,
                child: RichText(
                  text: TextSpan(text: title, style: bold),
                ),
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.topRight,
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
