import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Palette.dart';
import '../../assets.dart';
import '../screens.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _selected1 = false, _selected2 = false, _selected3 = false;
  TextStyle style = TextStyle(fontFamily: 'Poppins', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = MaterialButton(
      height: 50.0,
      minWidth: size.width * 0.4,
      shape: buttonBorder,
      //minWidth: MediaQuery.of(context).size.width,
      color: _selected1 ? Colors.white : PrimaryColor,
      textColor: _selected1 ? PrimaryColor : Colors.white,
      padding: buttonPadding,
      onPressed: () => {
        setState(() => _selected1 = !_selected1),
        print('Log in'),
        Navigator.of(context).push(_createLoginRoute())
      },
      child: Text(
        "Log In",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    );

    final registerButton = MaterialButton(
      height: 50.0,
      minWidth: size.width * 0.4,
      shape: buttonBorder,
      //minWidth: MediaQuery.of(context).size.width,
      color: _selected2 ? Colors.white : PrimaryColor,
      textColor: _selected2 ? PrimaryColor : Colors.white,
      padding: buttonPadding,
      onPressed: () => {
        setState(() => _selected2 = !_selected2),
        print('Sign Up'),
        Navigator.of(context).push(_createRegisterRoute())
      },
      child: Text(
        "Sign up",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    );

    return new Container(
        color: PrimaryColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                  width: size.width * 6,
                  height: size.height * 2.5,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Image.asset(Assets.splashScreenLogo)),
              flex: 1,
            ),
            Expanded(
              flex: 1,
              child: Center(
                  child: Column(children: <Widget>[
                RichText(
                  text: TextSpan(text: "Guten Tag!", style: bold),
                ),
                RichText(
                  text: TextSpan(
                      text: "Choose CEO Mitra Community", style: light),
                ),
                Container(
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        loginButton,
                        SizedBox(width: size.width * 0.07),
                        registerButton,
                      ],
                    )),
                Container(
                    padding: EdgeInsets.only(top: size.height * 0.03),
                    child: RichText(
                      text: TextSpan(text: "Or", style: light),
                    )),
                Container(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 24,
                        height: 24,
                        onPressed: () => {print("Apple")},
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset(
                          Assets.appleLogo,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                      MaterialButton(
                        minWidth: 24,
                        height: 24,
                        onPressed: () => {print("Google")},
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset(
                          Assets.googleLogo,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
            ),
          ],
        ));
  }

  final buttonPadding =
      new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0);

  final buttonBorder = new RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
    side: BorderSide(color: Colors.white, width: 2.0),
  );

  final bold = new TextStyle(
      fontFamily: 'Poppins',
      fontSize: 32.0,
      color: Colors.white,
      fontWeight: FontWeight.w700 // bold
      );
  final light = new TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0,
      color: Colors.white,
      fontWeight: FontWeight.w300 // medium
      );

  Route _createLoginRoute() {
    _selected1 = false;
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
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

  Route _createRegisterRoute() {
    _selected2 = false;
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignUpScreen(),
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
