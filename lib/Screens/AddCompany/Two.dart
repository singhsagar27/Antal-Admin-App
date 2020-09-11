import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:leads_in/widgets/CustomAppBar.dart';
import 'package:leads_in/widgets/RaisedGradientButton.dart';
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
    Size size = MediaQuery.of(context).size;
    return RaisedGradientButton(
      height: 50.0,
      width: size.width * 0.8,
      gradient: LinearGradient(
        colors: [
          MainColorLight,
          MainColor,
        ],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
      ),
      //minWidth: MediaQuery.of(context).size.width,

      onPressed: () {
        Navigator.of(context).push(_createRegisterCompanyRoute());
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Save & Next",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            width: size.width * 0.03,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget Appbar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomAppBar(
      height: 240,
      child: SafeArea(
        child: Container(
          width: size.width,
          child: Padding(
            padding: new EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 10,
            ),
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
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 27.0,
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
                                fontSize: 24.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500 // bol
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                  unselectedStepColorIn: MainColor,
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
                    SizedBox(width: 20),
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
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
                            FormBuilderTextField(
                              maxLines: 1,
                              attribute: 'companyEmail',
                              focusNode: _focusNode,
                              decoration: InputDecoration(
                                labelText: 'Companay Email',
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                errorStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                              ),
                              validators: [
                                FormBuilderValidators.required(),
                                FormBuilderValidators.email(),
                              ],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            FormBuilderPhoneField(
                              attribute: 'companyPhone',
                              decoration: InputDecoration(
                                labelText: 'Company Phone',
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                errorStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                              ),
                              validators: [FormBuilderValidators.required()],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                              // isExpanded: false,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            FormBuilderTextField(
                              maxLines: 1,
                              obscureText: false,
                              attribute: 'ceoName',
                              decoration: InputDecoration(
                                labelText: 'Ceo Name',
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                errorStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                              ),
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            FormBuilderPhoneField(
                              attribute: 'ceoNumber',
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Ceo Number',
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                errorStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                              ),
                              validators: [FormBuilderValidators.required()],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                              // isExpanded: false,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            FormBuilderPhoneField(
                              attribute: 'hrNumber',
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'HR Contact Number',
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                errorStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                              ),
                              validators: [FormBuilderValidators.required()],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                              // isExpanded: false,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: "Location",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                      color: MainColor,
                                    )),
                              ),
                            ),
                            FormBuilderTextField(
                              maxLines: 1,
                              obscureText: false,
                              attribute: 'streetOne',
                              decoration: InputDecoration(
                                labelText: 'Street 1',
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                errorStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),

                                //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                              ),
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
                              decoration: InputDecoration(
                                labelText: 'Street 2',
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),

                                errorStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                              ),
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                            ),
                            FormBuilderTextField(
                              maxLines: 1,
                              obscureText: false,
                              attribute: 'city',
                              decoration: InputDecoration(
                                labelText: 'City',
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                errorStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                              ),
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                            ),
                            FormBuilderTextField(
                              maxLines: 1,
                              obscureText: false,
                              attribute: 'state',
                              decoration: InputDecoration(
                                labelText: 'State',
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                errorStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                              ),
                              validators: [
                                FormBuilderValidators.required(),
                              ],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                            ),
                            FormBuilderTextField(
                              maxLines: 1,
                              obscureText: false,
                              attribute: 'pinCode',
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Pin',

                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                errorStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                              ),
                              validators: [
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric(),
                              ],
                              valueTransformer: (value) =>
                                  value.toString().trim(),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
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
