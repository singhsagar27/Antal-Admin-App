import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:leads_in/Screens/Dashboard/component/body.dart';

import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/screens.dart';
import 'package:leads_in/assets.dart';

class AddPartnerScreenThree extends StatefulWidget {
  AddPartnerScreenThree({
    Key key,
  }) : super(key: key);

  @override
  _RegisterCompanyState createState() => _RegisterCompanyState();
}

class _RegisterCompanyState extends State<AddPartnerScreenThree> {
  GlobalKey<ScaffoldState> _key;
  FocusNode _focusNode;
  var genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SetBody(_key, context),
    );
  }

  Widget RegisterCompanyButton() {
    return MaterialButton(
      height: 50.0,
      minWidth: 150.0,
      shape: buttonBorder,
      //minWidth: MediaQuery.of(context).size.width,
      color: PrimaryColor,
      textColor: Colors.white,
      padding: buttonPadding,
      onPressed: () {
        Navigator.of(context).push(_createRegisterCompanyRoute());
      },
      child: Text(
        "Register Company",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
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
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    top: size.width * 0.05,
                    bottom: size.width * 0.05),
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(text: "Back", style: bold),
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
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(Assets.profile),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                                text: "Register Company",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 26.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500 // bol
                                    )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                                text: "3. Billing Details",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400 // bol
                                    )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    FormBuilder(
                        key: globalKey,
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
                                      text: "Bank Name",
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
                                attribute: 'bankName',
                                focusNode: _focusNode,
                                valueTransformer: (value) =>
                                    value.toString().trim(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                      text: "Account Number",
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
                                attribute: 'accountNumber',
                                focusNode: _focusNode,
                                validators: [
                                  FormBuilderValidators.required(),
                                ],
                                valueTransformer: (value) =>
                                    value.toString().trim(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                      text: "IFSC",
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
                                attribute: 'ifsc',
                                focusNode: _focusNode,
                                validators: [
                                  FormBuilderValidators.required(),
                                ],
                                valueTransformer: (value) =>
                                    value.toString().trim(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                      text: "Aadhar Number",
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
                                attribute: 'aadharNumber',
                                focusNode: _focusNode,
                                validators: [
                                  FormBuilderValidators.required(),
                                ],
                                valueTransformer: (value) =>
                                    value.toString().trim(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                      text: "PAN Number",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w200,
                                        color: PrimaryColor,
                                      )),
                                ),
                              ),
                              FormBuilderTextField(
                                attribute: 'panNumber',
                                decoration: const InputDecoration(),
                                // initialValue: 'Male',
                                validators: [
                                  FormBuilderValidators.required(),
                                ],
                                valueTransformer: (value) =>
                                    value.toString().trim(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  RegisterCompanyButton(),
                                ],
                              ),
                            ]))),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  final buttonPadding =
      new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0);

  final buttonBorder = new RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
    side: BorderSide(color: Colors.white, width: 0.0),
  );

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

  Route _createRegisterCompanyRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Dashboard(),
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
