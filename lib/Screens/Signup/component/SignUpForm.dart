import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/screens.dart';
import 'package:leads_in/assets.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
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
  FocusNode _focusNode;
  static final GlobalKey<FormBuilderState> _fbKey =
      GlobalKey<FormBuilderState>();
  bool _mobileHasError = false;
  bool _passwordHasError = false;
  bool _emailHasError = false;
  bool _confirmPasswordHasError = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final registerButton = MaterialButton(
      height: 50.0,
      minWidth: 150.0,
      shape: buttonBorder,
      //minWidth: MediaQuery.of(context).size.width,
      color: PrimaryColor,
      textColor: Colors.white,
      padding: buttonPadding,
      onPressed: () {
        if (_fbKey.currentState.saveAndValidate()) {
          print(_fbKey.currentState.value);
          Navigator.of(context).push(_createPinVerificationRoute());
        } else {
          print(_fbKey.currentState.value);
          print('validation failed');
          print('Sign Up');
        }
      },
      child: Text(
        "Sign Up",
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
                  bottom: size.height * 0.02),
              child: Column(children: <Widget>[
                FormBuilderPhoneField(
                  maxLines: 1,
                  attribute: 'mobile',
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    labelText: 'Mobile',
                    //suffixIcon: _mobileHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                  ),
                  validators: [
                    FormBuilderValidators.required(
                        errorText: "Please Enter Mobile"),
                  ],
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      _mobileHasError = !_fbKey
                          .currentState.fields['mobile'].currentState
                          .validate();
                    });
                  },
                  valueTransformer: (value) => value.toString().trim(),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                FormBuilderTextField(
                  maxLines: 1,
                  obscureText: false,
                  attribute: 'email',
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    labelText: 'Email ID',
                    //suffixIcon: _emailHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      _emailHasError = !_fbKey
                          .currentState.fields['email'].currentState
                          .validate();
                    });
                  },
                  valueTransformer: (text) {
                    return text == null ? null : text.toString().trim();
                  },
                  validators: [
                    FormBuilderValidators.required(
                        errorText: "Please Enter Email"),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                FormBuilderTextField(
                  maxLines: 1,
                  obscureText: true,
                  attribute: 'password',
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      _passwordHasError = !_fbKey
                          .currentState.fields['password'].currentState
                          .validate();
                    });
                  },
                  valueTransformer: (text) {
                    return text == null ? null : text.toString().trim();
                  },
                  validators: [
                    FormBuilderValidators.required(
                        errorText: "Please Enter Password"),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                FormBuilderTextField(
                  maxLines: 1,
                  obscureText: true,
                  attribute: 'confirmPassword',
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      _confirmPasswordHasError = !_fbKey
                          .currentState.fields['confirmPassword'].currentState
                          .validate();
                    });
                  },
                  valueTransformer: (text) {
                    return text == null ? null : text.toString().trim();
                  },
                  validators: [
                    FormBuilderValidators.required(
                        errorText: "Please Enter Confirm Password"),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: "Or Sign Up Using",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w200,
                          color: PrimaryColor,
                        )),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          color: Colors.blue,
                        ),
                      ),
                    ]),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    registerButton,
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Already Have Account? ",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w200,
                                color: PrimaryColor,
                              ),
                            ),
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: PrimaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .push(_createLoginRoute());
                                },
                            )
                          ],
                        ),
                      ),
                    ]),
              ]))),
    );
  }

  final buttonPadding =
      new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0);

  final buttonBorder = new RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
    side: BorderSide(color: Colors.white, width: 0.0),
  );

  Route _createLoginRoute() {
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

  Route _createPinVerificationRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          OtpVerificationScreen(),
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
