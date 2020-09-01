import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/models/login_model.dart';
import 'package:leads_in/services/auth_service.dart';
import '../../../assets.dart';
import '../../screens.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
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
  GlobalKey<FormBuilderState> _fbKey;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _fbKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final loginButton = MaterialButton(
      height: 50.0,
      minWidth: 150.0,
      shape: buttonBorder,
      //minWidth: MediaQuery.of(context).size.width,
      color: PrimaryColor,
      textColor: Colors.white,
      padding: buttonPadding,
      onPressed: () async {
        if (_fbKey.currentState.saveAndValidate()) {
          print(_fbKey.currentState.value);

          ///Move this to after success login later
          Navigator.of(context).push(_createLoginRoute());
          final note = LoginModel(
              UserMobile: _usernameController.text,
              UserPass: _passwordController.text
          );
          final result = await Auth.login_api(note);
          final title = result.error ? 'Error':'Success';
          result.error ? showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(title),
                content: Text('Something went wrong'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              )
          )
              .then((data) {
            if (result.data) {

              Navigator.of(context).pop();

            }
          }):showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Successfully Logged In!!!'),
                content: Text(result.successMessage),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();

                    },
                  )
                ],
              )
          );
        } else {
          print(_fbKey.currentState.value);
          print('validation failed');
          print('Log in');
        }
      },
      child: Text(
        "Login",
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                        text: "Mobile",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w200,
                          color: PrimaryColor,
                        )),
                  ),
                ),
                FormBuilderTextField(
                  maxLines: 1,
                  obscureText: false,
                  attribute: 'mobile',
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                  controller: _usernameController,
                  valueTransformer: (value) => value.toString().trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                        text: "Password",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w200,
                          color: PrimaryColor,
                        )),
                  ),
                ),
                FormBuilderTextField(
                  maxLines: 1,
                  obscureText: true,
                  attribute: 'password',
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                  controller: _passwordController,
                  valueTransformer: (value) => value.toString().trim(),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: "Or Login Using",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w200,
                          color: PrimaryColor,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    loginButton,
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Don't Have Account? ",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w200,
                                color: PrimaryColor,
                              ),
                            ),
                            TextSpan(
                              text: "SignUp",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: PrimaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .push(_createSignUpRoute());
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

  Route _createLoginRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PinLoginScreen(),
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