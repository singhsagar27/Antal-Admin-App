import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';

class RegisterCompanyScreenThree extends StatefulWidget {
  RegisterCompanyScreenThree({
    Key key,
  }) : super(key: key);

  @override
  _RegisterCompanyState createState() => _RegisterCompanyState();
}

class _RegisterCompanyState extends State<RegisterCompanyScreenThree> {
  GlobalKey<ScaffoldState> _key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SetBody(_key, context),
    );
  }

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
