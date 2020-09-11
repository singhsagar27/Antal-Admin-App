import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/assets.dart';
import 'package:leads_in/widgets/CustomAppBar.dart';
import 'package:leads_in/widgets/RaisedGradientButton.dart';

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
              top: size.height * 0.15,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                //Background
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
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      iconSize: 30,
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        print("Close");
                      },
                    ),
                  ),
                  CircularProfileAvatar(
                    '',
                    child: Image.asset(
                      Assets.profile,
                      fit: BoxFit.cover,
                    ),
                    radius: 65,
                    backgroundColor: Colors.transparent,
                    borderWidth: 0,
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
                          text: "Bob Jr",
                          style: TextStyle(
                            color: MainColor,
                            fontSize: 32,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: RichText(
                      text: TextSpan(
                          text: "Builer",
                          style: TextStyle(
                            color: PrimaryDarkColor,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Divider(
                    thickness: 20,
                    color: Colors.grey[100],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                            left: 30,
                            right: 30,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Reporting Officer :",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "John Cena",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Office Location :",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Mumbai",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 20,
                          color: Colors.grey[100],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                            left: 30,
                            right: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            text: "Email ID :",
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: Image.asset(
                                          Assets.editLight,
                                          width: 30,
                                          height: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "email@example.com",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Mobile Number :",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "23612836",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.grey[100],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                            left: 30,
                            right: 30,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Image.asset(
                                          Assets.iconEdit,
                                          width: 24,
                                          height: 24,
                                        )),
                                  ),
                                  TextSpan(
                                    text: "Emergency Contact",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: MainColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Divider(
                          thickness: 20,
                          color: Colors.grey[100],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                            left: 30,
                            right: 30,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text: "Change Password",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: MainColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.grey[100],
                        ),
                      ],
                    ),
                  ),
                  RaisedGradientButton(
                    height: 54.0,
                    width: size.width * 0.8,

                    //minWidth: MediaQuery.of(context).size.width,
                    gradient: LinearGradient(
                      colors: [
                        Orange,
                        DullRed,
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                    ),
                    onPressed: () {
                      print("Log out");
                    },
                    child: Text(
                      "Log Out",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
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
