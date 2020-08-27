import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:leads_in/Palette.dart';

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
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Padding(
            padding: new EdgeInsets.only(
                left: size.width * 0.10,
                right: size.width * 0.10,
                top: size.height * 0.08,
                bottom: size.height * 0.08),
            child: Column(children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                      text: "Username / Email ID",
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
                attribute: 'email',
                validators: [
                  FormBuilderValidators.required(),
                ],
                onChanged: (value) => print(value),
                valueTransformer: (value) => value.toString().trim(),
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
                onChanged: (value) => print(value),
                valueTransformer: (value) => value.toString().trim(),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_fbKey.currentState.saveAndValidate()) {
                        print(_fbKey.currentState.value);
                      } else {
                        print(_fbKey.currentState.value);
                        print('validation failed');
                      }
                    },
                  ),
                ],
              ),
            ])));
  }
}
