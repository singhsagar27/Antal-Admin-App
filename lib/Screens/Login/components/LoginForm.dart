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
  FocusNode _focusNode;
  GlobalKey<FormBuilderState> _fbKey;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _mobileHasError = false;
  bool _passwordHasError = false;

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
              UserPass: _passwordController.text);
          final result = await Auth.login_api(note);
          final title = result.error ? 'Error' : 'Success';
          result.error
              ? showDialog(
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
                      )).then((data) {
                  if (result.data) {
                    Navigator.of(context).pop();
                  }
                })
              : showDialog(
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
                      ));
        } else {
          print(_fbKey.currentState.value);
          print('validation failed');
          print('Log in');
        }
      },
      child: Text(
        "Login",
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
              child: Column(children: <Widget>[
                FormBuilderTextField(
                  maxLines: 1,
                  obscureText: false,
                  style: TextStyle(fontFamily: 'Poppins'),
                  attribute: 'mobile',
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    labelText: 'Mobile',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                    errorStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                    //suffixIcon: _mobileHasError? Icon(Icons.error, color: Colors.red): Icon(Icons.check, color: Colors.green),
                  ),
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      _mobileHasError = !_fbKey
                          .currentState.fields['mobile'].currentState
                          .validate();
                    });
                  },
                  valueTransformer: (text) {
                    return text == null ? null : text.toString().trim();
                  },
                  validators: [
                    FormBuilderValidators.required(
                        errorText: "Please Enter Mobile"),
                    FormBuilderValidators.numeric(),
                    //FormBuilderValidators.maxLength(10),
                    //FormBuilderValidators.minLength(10),
                  ],
                  controller: _usernameController,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                FormBuilderTextField(
                  maxLines: 1,
                  style: TextStyle(fontFamily: 'Poppins'),
                  obscureText: true,
                  attribute: 'password',
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    labelText: 'Password',
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
                  controller: _passwordController,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: "Forgot Password.?",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: "Or Login Using",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                        color: PrimaryColor,
                      ),
                    ),
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
                        minWidth: 30,
                        height: 30,
                        onPressed: () => {print("Apple")},
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset(
                          Assets.appleLogo,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                          color: Colors.grey,
                        ),
                      ),
                      MaterialButton(
                        minWidth: 30,
                        height: 30,
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
                    loginButton,
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Don't Have Account? ",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
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
                              Navigator.of(context).push(_createSignUpRoute());
                            },
                        )
                      ],
                    ),
                  ),
                ),
              ]))),
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
