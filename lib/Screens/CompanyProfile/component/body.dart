import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/assets.dart';

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
    return Scaffold(
      body: SetBody(_key, context),
    );
  }

  Widget SetBody(GlobalKey<ScaffoldState> globalKey, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 110,
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
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      Assets.profile,
                      width: 24,
                      height: 24,
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
                                        text: "Officer Name",
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
                                height: 10,
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
                                        text: "Location Address",
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
                                          Assets.profile,
                                          width: 24,
                                          height: 24,
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
                                height: 10,
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        child: Image.asset(
                                          Assets.profile,
                                          width: 24,
                                          height: 24,
                                        )),
                                  ),
                                  TextSpan(
                                    text: "Emergency Contact",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: PrimaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                                  color: PrimaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    height: 50.0,
                    minWidth: 150.0,
                    shape: buttonBorder,
                    //minWidth: MediaQuery.of(context).size.width,
                    color: PrimaryColor,
                    textColor: Colors.white,
                    padding: buttonPadding,
                    onPressed: () {
                      print("Log out");
                    },
                    child: Text(
                      "Log Out",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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

  final buttonPadding =
      new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0);

  final buttonBorder = new RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
    side: BorderSide(color: Colors.white, width: 0.0),
  );
}
