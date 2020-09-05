import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leads_in/assets.dart';
import 'package:leads_in/widgets/CustomAppBar.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileList();
  }
}

class ProfileList extends StatefulWidget {
  ProfileList({
    Key key,
  }) : super(key: key);

  @override
  ProfileListState createState() {
    return ProfileListState();
  }
}

class ProfileListState extends State<ProfileList> {
  GlobalKey<ScaffoldState> _key;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Appbar(context),
      body: SetBody(_key, context),
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
              children: <Widget>[],
            ),
          ),
        ),
      ),
    );
  }

  Widget SetBody(GlobalKey<ScaffoldState> globalKey, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: size.width,
        child: Stack(
          children: <Widget>[
            Container(
              child: CircularProfileAvatar(
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
                  print("Profile");
                },
              ),
              //Image
            ),
            Container(
                //Data
                ),
          ],
        ),
      ),
    );
  }
}
