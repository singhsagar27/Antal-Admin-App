import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/screens.dart';
import 'package:leads_in/assets.dart';
import 'package:leads_in/models/admin_company.dart';
import 'package:leads_in/services/auth_service.dart';

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

  TextEditingController   company_name = TextEditingController();
  TextEditingController   company_email = TextEditingController();
  TextEditingController   mobile = TextEditingController();
  TextEditingController   contact_person = TextEditingController();
  TextEditingController   password = TextEditingController();
  TextEditingController   password1 = TextEditingController();
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
      onPressed: () async {
        if (_fbKey.currentState.saveAndValidate()) {
          print(_fbKey.currentState.value);
          final note = AdminCompanyModel(
              company_name: company_name.text,
              company_email: company_email.text,
              mobile: mobile.text,
              contact_person: contact_person.text,
              password: password.text,
              );
          final result = await Auth.register_api(note);
          print(result.errorMessage);
          final title = result.error ? 'Registration Failed' : 'Success';
          result.error
              ? showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text(title),
                        content: Text('Registration Failed !!!'),
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
                        title: Text('Successfully Registered!!!'),
                        content: Text(result.successMessage),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(_createRegisterAdminRoute());
                            },
                          )
                        ],
                  ),
              );
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
                          FormBuilderTextField(
                            decoration: InputDecoration(
                                  labelText: 'Company Name',
                                ),
                            maxLines: 1,
                            attribute: 'companyName',
                            focusNode: _focusNode,
                            validators: [
                              FormBuilderValidators.required(),
                            ],
                            controller: company_name,
                            valueTransformer: (value) =>
                                value.toString().trim(),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          
                          FormBuilderTextField(
                            decoration: InputDecoration(
                                  labelText: 'Company Email',
                                ),
                            maxLines: 1,
                            obscureText: false,
                            attribute: 'email',
                            focusNode: _focusNode,
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
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email()
                            ],
                            controller: company_email ,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          
                          FormBuilderTextField(
                            decoration: InputDecoration(
                                  labelText: 'Company Contact No',
                                ),
                            maxLines: 1,
                            attribute: 'mobile',
                            focusNode: _focusNode,
                            
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.maxLength(10),
                              FormBuilderValidators.numeric(),
                            ],
                            controller: mobile,
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
                            height: 20,
                          ),
                          
                          FormBuilderTextField(
                            decoration: InputDecoration(
                                  labelText: 'Contact Person Name',
                                ),
                            maxLines: 1,
                            obscureText: false,
                            attribute: 'Contact Person Name',
                            validators: [
                              FormBuilderValidators.required(),
                            ],
                            controller: contact_person,
                            valueTransformer: (value) =>
                                value.toString().trim(),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          
                          FormBuilderTextField(
                            decoration: InputDecoration(
                                  labelText: 'Password',
                                ),
                            maxLines: 1,
                            obscureText: true,
                            attribute: 'password',
                            focusNode: _focusNode,
                            
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
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6, errorText: 'Your password must be between 6 and 20 characters'),
                              FormBuilderValidators.maxLength(20, errorText: 'Your password must be between 6 and 20 characters'),
                            ],
                            controller: password1,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          
                          FormBuilderTextField(
                            decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                ),
                            maxLines: 1,
                            obscureText: true,
                            attribute: 'confirmPassword',
                            focusNode: _focusNode,
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
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6, errorText: 'Your password must be between 6 and 20 characters'),
                              FormBuilderValidators.maxLength(20, errorText: 'Your password must be between 6 and 20 characters'),
                              (val){
                                if (val != password1.text){
                                  print('val');
                                  print(val);
                                  print(password1);
                                  return "Passwords does not match";
                                }
                              }
                              
                            ],
                            controller: password,
                          ),
                          FormBuilderCheckbox(
                            attribute: 'accept_terms',
                            label: Text(
                                "I have read and agree to the terms and conditions"),
                            validators: [
                              FormBuilderValidators.requiredTrue(
                                errorText:
                                    "You must accept terms and conditions to continue",
                              ),
                            ],
                          ),
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

Route _createRegisterAdminRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          AddAdminScreenTwo(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
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
