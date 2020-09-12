import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:leads_in/widgets/CustomAppBar.dart';
import 'package:leads_in/widgets/StepsIndicator.dart';

import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/screens.dart';
import 'package:leads_in/assets.dart';

class AddCompanyScreenTwo extends StatefulWidget {
  AddCompanyScreenTwo({
    Key key,
  }) : super(key: key);

  @override
  _RegisterCompanyState createState() => _RegisterCompanyState();
}

class _RegisterCompanyState extends State<AddCompanyScreenTwo> {
  GlobalKey<ScaffoldState> _key;
  FocusNode _focusNode;
  var genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(context),
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
        "Save and Next",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget Appbar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomAppBar(
        height: 270,
        child: SafeArea(
          child: Container(
            width: size.width,
            child: Padding(
              padding:
                  new EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
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
                    height: 20,
                  ),
                  StepsIndicator(
                    selectedStep: 1,
                    nbSteps: 3,
                    selectedStepColorOut: Colors.white,
                    selectedStepColorIn: Colors.white,
                    doneStepColor: Colors.white,
                    unselectedStepColorOut: Colors.white,
                    unselectedStepColorIn: PrimaryColor,
                    doneLineColor: Colors.white,
                    undoneLineColor: Colors.grey,
                    isHorizontal: true,
                    lineLength: 120,
                    donelineThickness: 2,
                    doneStepSize: 15,
                    unselectedStepSize: 15,
                    selectedStepSize: 17,
                    selectedStepBorderSize: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                              text: "2. Contact Details",
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
        ));
  }

  Widget SetBody(GlobalKey<ScaffoldState> globalKey, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
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
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  text: "Company Email",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w200,
                                    color: PrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            FormBuilderTextField(
                              maxLines: 1,
                              attribute: 'companyEmail',
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
                                  text: "Company Contact Number",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w200,
                                    color: PrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            FormBuilderPhoneField(
                              attribute: 'companyPhone',
                              decoration: const InputDecoration(),
                              // initialValue: 'Male',
                              validators: [FormBuilderValidators.required()],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                              // isExpanded: false,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  text: "Ceo Name",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w200,
                                    color: PrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            FormBuilderTextField(
                              maxLines: 1,
                              obscureText: false,
                              attribute: 'ceoName',
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
                                  text: "Ceo Number",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w200,
                                    color: PrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            FormBuilderPhoneField(
                              attribute: 'ceoNumber',
                              decoration: const InputDecoration(),
                              // initialValue: 'Male',
                              validators: [FormBuilderValidators.required()],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                              // isExpanded: false,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  text: "HR Contact Number",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w200,
                                    color: PrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            FormBuilderPhoneField(
                              attribute: 'hrNumber',
                              decoration: const InputDecoration(),
                              // initialValue: 'Male',
                              validators: [FormBuilderValidators.required()],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                              // isExpanded: false,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                  text: "Client Location",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w200,
                                    color: PrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            FormBuilderTextField(
                              maxLines: 1,
                              obscureText: false,
                              attribute: 'streetOne',
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                            ),
                            FormBuilderTextField(
                              maxLines: 1,
                              obscureText: false,
                              attribute: 'streetTwo',
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: "City",
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
                              attribute: 'city',
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: "State",
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
                              attribute: 'state',
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: "Pin",
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
                              attribute: 'pinCode',
                              validators: [
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric(),
                              ],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                RegisterCompanyButton(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
      pageBuilder: (context, animation, secondaryAnimation) =>
          AddCompanyScreenThree(),
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
}