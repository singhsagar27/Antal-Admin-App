import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/models/login_model.dart';
import 'package:leads_in/services/auth_service.dart';
import '../../../assets.dart';
import '../../screens.dart';

class SetNewPasswordForm extends StatelessWidget {
  SetNewPasswordForm({
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
  GlobalKey<FormBuilderState> _fbKey;
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  bool _confirmPasswordHasError = false;
  bool _newPasswordHasError = false;

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
      height: 54.0,
      minWidth: size.width * 0.4,
      shape: buttonBorder,
      //minWidth: MediaQuery.of(context).size.width,
      color: MainColor,
      textColor: Colors.white,
      padding: buttonPadding,
      onPressed: () {
        Navigator.of(context).push(_createLoginRoute());
        print('Log in');
      },
      child: Text(
        "Set",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.normal),
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
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                maxLines: 1,
                style: TextStyle(fontFamily: 'Poppins'),
                obscureText: true,
                attribute: 'password',
                focusNode: _focusNode,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  errorStyle: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                ),
                onChanged: (val) {
                  print(val);
                  setState(() {
                    _newPasswordHasError = !_fbKey
                        .currentState.fields['password'].currentState
                        .validate();
                  });
                },
                valueTransformer: (text) {
                  return text == null ? null : text.toString().trim();
                },
                validators: [
                  FormBuilderValidators.required(
                      errorText: "Please Enter New Password"),
                ],
                controller: _newPasswordController,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              FormBuilderTextField(
                maxLines: 1,
                style: TextStyle(fontFamily: 'Poppins'),
                obscureText: true,
                attribute: 'confirmPassword',
                focusNode: _focusNode,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  errorStyle: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                ),
                onChanged: (val) {
                  print(val);
                  setState(() {
                    _confirmPasswordHasError = !_fbKey
                        .currentState.fields['password'].currentState
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
                controller: _confirmPasswordController,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  loginButton,
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final buttonPadding =
      new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0);

  final buttonBorder = new RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(27.0),
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
}
