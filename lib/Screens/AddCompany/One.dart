import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/screens.dart';
import 'package:leads_in/assets.dart';
import 'package:leads_in/widgets/CustomAppBar.dart';
import 'package:leads_in/widgets/StepsIndicator.dart';
import 'package:leads_in/widgets/RaisedGradientButton.dart';

class AddCompanyScreenOne extends StatefulWidget {
  AddCompanyScreenOne({
    Key key,
  }) : super(key: key);

  @override
  _RegisterCompanyState createState() => _RegisterCompanyState();
}

class _RegisterCompanyState extends State<AddCompanyScreenOne> {
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
      height: 54.0,
      width: size.width * 0.8,
      gradient: LinearGradient(
        colors: [
          Color(0xFF3186E3),
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
        height: size.height * 0.37,
        child: SafeArea(
          child: Container(
            width: size.width,
            child: Padding(
              padding: new EdgeInsets.only(
                left: size.width * 0.03,
                right: size.width * 0.03,
                top: size.height * 0.02,
                bottom: size.height * 0.02,
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
                    height: size.height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: size.width * 0.02,
                      right: size.width * 0.02,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 27.0,
                          backgroundImage: AssetImage(Assets.profile),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: size.width * 0.02),
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
                    height: size.height * 0.03,
                  ),
                  StepsIndicator(
                    selectedStep: 0,
                    nbSteps: 3,
                    selectedStepColorOut: Colors.white,
                    selectedStepColorIn: Colors.white,
                    doneStepColor: Colors.white,
                    unselectedStepColorOut: Colors.white,
                    unselectedStepColorIn: MainColor,
                    doneLineColor: Colors.white,
                    undoneLineColor: Colors.grey,
                    isHorizontal: true,
                    lineLength: size.width * 0.3,
                    donelineThickness: 2,
                    doneStepSize: 15,
                    unselectedStepSize: 15,
                    selectedStepSize: 17,
                    selectedStepBorderSize: 1,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: size.width * 0.03),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            text: "1. Basic Information",
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
        ));
  }

  Widget SetBody(GlobalKey<ScaffoldState> globalKey, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
                          left: size.width * 0.07,
                          right: size.width * 0.07,
                          top: size.height * 0.02,
                          bottom: size.height * 0.02),
                      child: Column(
                        children: <Widget>[
                          FormBuilderTextField(
                            maxLines: 1,
                            attribute: 'companyName',
                            focusNode: _focusNode,
                            decoration: InputDecoration(
                              labelText: 'Company Name',
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                  text: "Entry Type",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    color: MainColor,
                                  )),
                            ),
                          ),
                          FormBuilderDropdown(
                            attribute: 'entryType',
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              errorStyle: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                              border: OutlineInputBorder(),
                              //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                            ),
                            // initialValue: 'Male',
                            hint: Text('Entry Type'),
                            validators: [FormBuilderValidators.required()],
                            items: genderOptions
                                .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text('$gender'),
                                    ))
                                .toList(),
                            // isExpanded: false,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          FormBuilderTextField(
                            maxLines: 1,
                            obscureText: false,
                            attribute: 'size',
                            decoration: InputDecoration(
                              labelText: 'Company Size',
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                  text: "Industry Type",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    color: MainColor,
                                  )),
                            ),
                          ),
                          FormBuilderDropdown(
                            attribute: 'industryType',
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(),

                              errorStyle: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                              //suffixIcon: _passwordHasError ? Icon(Icons.error, color: Colors.red) : Icon(Icons.check, color: Colors.green),
                            ),
                            // initialValue: 'Male',
                            hint: Text('Industry Type'),
                            validators: [FormBuilderValidators.required()],
                            items: genderOptions
                                .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text('$gender'),
                                    ))
                                .toList(),
                            // isExpanded: false,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          FormBuilderTextField(
                            maxLines: 4,
                            attribute: 'keyProducts',
                            decoration: InputDecoration(
                              labelText: 'Key Products',
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
                          FormBuilderFilterChip(
                            attribute: 'keyProducts',
                            decoration: const InputDecoration(
                              labelText: 'Key Products',
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                              errorStyle: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                            ),
                            options: [
                              FormBuilderFieldOption(
                                  value: 'Key Product 1',
                                  child: Text('Key Product 1')),
                              FormBuilderFieldOption(
                                  value: 'Key Product 2',
                                  child: Text('Key Product 2')),
                              FormBuilderFieldOption(
                                  value: 'Key Product 3',
                                  child: Text('Key Product 3')),
                              FormBuilderFieldOption(
                                  value: 'Key Product 4',
                                  child: Text('Key Product 4')),
                              FormBuilderFieldOption(
                                  value: 'Key Product 5',
                                  child: Text('Key Product 5')),
                            ],
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
    );
  }

  final bold = new TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18.0,
      color: Colors.white,
      fontWeight: FontWeight.w500 // bold
      );
  final buttonPadding =
      new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0);

  final buttonBorder = new RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
    side: BorderSide(color: Colors.white, width: 0.0),
  );

  //Custom drawer
  buildProfileDrawer() {
    return Drawer();
  }

  Route _createRegisterCompanyRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          AddCompanyScreenTwo(),
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
