import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:leads_in/Palette.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:leads_in/Screens/screens.dart';

class OtpVerificationForm extends StatelessWidget {
  OtpVerificationForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  var data;
  bool autoValidate = true;
  bool readOnly = false;
  FocusNode _focusNode;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  StreamController<ErrorAnimationType> errorController;
  bool hasError = false;
  String currentText;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  TapGestureRecognizer onTapRecognizer;

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final otpVerifyButton = MaterialButton(
      height: 54.0,
      minWidth: 150.0,
      shape: buttonBorder,
      //minWidth: MediaQuery.of(context).size.width,
      color: MainColor,
      textColor: Colors.white,
      padding: buttonPadding,
      onPressed: () {
        if (_fbKey.currentState.saveAndValidate()) {
          print(currentText);
          Navigator.of(context).push(_createPinSetRoute());
          setState(() {
            hasError = false;
          });
        } else {
          errorController.add(
              ErrorAnimationType.shake); // Triggering error shake animation
          setState(() {
            hasError = true;
          });
          print(_fbKey.currentState.value);
          print('validation failed');
          print('Pin verify');
        }
      },
      child: Text(
        "Verify",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    );

    return Container(
      child: FormBuilder(
          // context,
          key: _fbKey,
          child: Padding(
              padding: new EdgeInsets.only(
                  left: size.width * 0.10,
                  right: size.width * 0.10,
                  top: size.height * 0.05,
                  bottom: size.height * 0.05),
              child: Column(children: <Widget>[
                PinCodeTextField(
                  textStyle: PinText,
                  length: 5,
                  textInputType: TextInputType.number,
                  obsecureText: false,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v.length < 5) {
                      return "Please enter valid OTP";
                    } else {
                      return null;
                    }
                  },
                  focusNode: _focusNode,
                  onTap: () {
                    print("Pressed");
                  },
                  pinTheme: PinTheme(
                    activeColor: Colors.blue.shade200,
                    inactiveColor: Colors.blue.shade50,
                    shape: PinCodeFieldShape.underline,
                    fieldHeight: 50,
                    fieldWidth: 40,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: false,
                  errorAnimationController: errorController,
                  onCompleted: (value) {
                    print(value);
                    currentText = value;
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Code Not Received? ",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w200,
                                color: MainColor,
                              ),
                            ),
                            TextSpan(
                              text: "Resend",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: MainColor,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            )
                          ],
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    otpVerifyButton,
                  ],
                ),
              ]))),
    );
  }

  final PinText = new TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20.0,
      color: MainColor,
      fontWeight: FontWeight.w700 // bold
      );

  final buttonPadding =
      new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0);

  final buttonBorder = new RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
    side: BorderSide(color: Colors.white, width: 0.0),
  );

  Route _createSignUpRoute() {
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

  Route _createPinSetRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SetPinScreen(),
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
