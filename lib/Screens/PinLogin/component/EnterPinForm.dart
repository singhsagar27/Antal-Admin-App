import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/Common/number_pad.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../screens.dart';

class EnterPin extends StatelessWidget {
  EnterPin({
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
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  StreamController<ErrorAnimationType> errorController;
  final TextEditingController _controller = TextEditingController();
  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  TapGestureRecognizer onTapRecognizer;
  int count;

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

    void incrementCounter(String str) {
      //currentText = currentText + str;
      setState(() {
        if (_controller.text.length < 4) {
          _controller.text = _controller.text + str;

          // this changes cursor position
          _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length));
        }
        print(_controller.text);
      });

    }

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
                  backgroundColor: PrimaryColor,
                  textStyle: PinText,
                  length: 4,
                  textInputType: TextInputType.number,
                  obsecureText: false,
                  animationType: AnimationType.fade,
                  controller: _controller,
                  validator: (v) {
                    if (v.length < 4) {
                      return "Please enter valid OTP";
                    } else {
                      return null;
                    }
                  },
                  focusNode: AlwaysDisabledFocusNode(),
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
                  onCompleted: (v) {
                    print("Completed");
                    Navigator.of(context).push(_createDashBoardRoute());
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
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        NumberPad(
                          width: 50,
                          height: 50,
                          text: "1",
                          fontSize: 24,
                          color: PrimaryColor,
                          borderColor: Colors.white,
                          textColor: Colors.white,
                          onPressed: () => {
                            incrementCounter("1"),
                          },
                        ),
                        NumberPad(
                          width: 50,
                          height: 50,
                          text: "2",
                          fontSize: 24,
                          color: PrimaryColor,
                          borderColor: Colors.white,
                          textColor: Colors.white,
                          onPressed: () => {
                            incrementCounter("2"),
                          },
                        ),
                        NumberPad(
                          width: 50,
                          height: 50,
                          text: "3",
                          fontSize: 24,
                          color: PrimaryColor,
                          borderColor: Colors.white,
                          textColor: Colors.white,
                          onPressed: () => {
                            incrementCounter("3"),
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        NumberPad(
                          width: 50,
                          height: 50,
                          text: "4",
                          fontSize: 24,
                          color: PrimaryColor,
                          borderColor: Colors.white,
                          textColor: Colors.white,
                          onPressed: () => {
                            incrementCounter("4"),
                          },
                        ),
                        NumberPad(
                          width: 50,
                          height: 50,
                          text: "5",
                          fontSize: 24,
                          color: PrimaryColor,
                          borderColor: Colors.white,
                          textColor: Colors.white,
                          onPressed: () => {
                            incrementCounter("5"),
                          },
                        ),
                        NumberPad(
                          width: 50,
                          height: 50,
                          text: "6",
                          fontSize: 24,
                          color: PrimaryColor,
                          borderColor: Colors.white,
                          textColor: Colors.white,
                          onPressed: () => {
                            incrementCounter("6"),
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        NumberPad(
                          width: 50,
                          height: 50,
                          text: "7",
                          fontSize: 24,
                          color: PrimaryColor,
                          borderColor: Colors.white,
                          textColor: Colors.white,
                          onPressed: () => {
                            incrementCounter("7"),
                          },
                        ),
                        NumberPad(
                          width: 50,
                          height: 50,
                          text: "8",
                          fontSize: 24,
                          color: PrimaryColor,
                          borderColor: Colors.white,
                          textColor: Colors.white,
                          onPressed: () => {
                            incrementCounter("8"),
                          },
                        ),
                        NumberPad(
                          width: 50,
                          height: 50,
                          text: "9",
                          fontSize: 24,
                          color: PrimaryColor,
                          borderColor: Colors.white,
                          textColor: Colors.white,
                          onPressed: () => {
                            incrementCounter("9"),
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        NumberPad(
                          width: 50,
                          height: 50,
                          text: "0",
                          fontSize: 24,
                          color: PrimaryColor,
                          borderColor: Colors.white,                          textColor: Colors.white,
                          onPressed: () => {
                            incrementCounter("0"),
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: "Reset",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _controller.clear();
                        },
                    ),
                  ),
                ),
              ]))),
    );
  }

  final PinText = new TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20.0,
      color: Colors.white,
      fontWeight: FontWeight.w700 // bold
      );

  final buttonPadding =
      new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0);

  final buttonBorder = new RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
    side: BorderSide(color: Colors.white, width: 0.0),
  );
  final buttonBorder1 = new CircleBorder(
    side: BorderSide(color: Colors.white, width: 2.0),
  );

  Route _createDashBoardRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          DashboardScreen(),
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

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
