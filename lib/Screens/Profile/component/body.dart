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
              children: <Widget>[
                Container(
                    //Close Button
                    ),
              ],
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
        height: size.height,
        alignment: Alignment.topCenter,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 65,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                //Data
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  CircularProfileAvatar(
                    '',
                    child: Image.asset(
                      Assets.profile,
                      fit: BoxFit.cover,
                    ),
                    radius: 65,
                    backgroundColor: Colors.transparent,
                    borderWidth: 0,
                    initialsText: Text(
                      "AD",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    borderColor: Colors.transparent,
                    elevation: 5.0,
                    foregroundColor: Colors.brown.withOpacity(0.5),
                    cacheImage: true,
                    onTap: () {
                      print("Profile");
                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: RichText(
                      text: TextSpan(
                          text: "My name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: RichText(
                      text: TextSpan(
                          text: "My profession",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 20,
                    color: Colors.grey[100],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Reporting Officer :",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Officer Name",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Office Location :",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Officer Name",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              thickness: 20,
                              color: Colors.grey[100],
                            ),

                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              //Image
            ),
          ],
        ),
      ),
    );
  }
}
