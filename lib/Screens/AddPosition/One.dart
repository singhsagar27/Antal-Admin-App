import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/screens.dart';
import 'package:leads_in/assets.dart';
import 'package:leads_in/widgets/StepsIndicator.dart';

class AddPositionScreenOne extends StatefulWidget {
  AddPositionScreenOne({
    Key key,
  }) : super(key: key);

  @override
  _RegisterCompanyState createState() => _RegisterCompanyState();
}

class _RegisterCompanyState extends State<AddPositionScreenOne> {
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
      color: MainColor,
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
                                  text: "Add Position",
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
                        selectedStep: 0,
                        nbSteps: 4,
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                  text: "1. Position Details",
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
                                        text: "Client Name",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w200,
                                          color: MainColor,
                                        )),
                                  ),
                                ),
                                FormBuilderDropdown(
                                  attribute: 'clientName',
                                  decoration: const InputDecoration(),
                                  // initialValue: 'Male',
                                  hint: Text('Client Name'),
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  items: genderOptions
                                      .map((gender) => DropdownMenuItem(
                                            value: gender,
                                            child: Text('$gender'),
                                          ))
                                      .toList(),
                                  // isExpanded: false,
                                  allowClear: true,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Department Name",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w200,
                                          color: MainColor,
                                        )),
                                  ),
                                ),
                                FormBuilderTextField(
                                  maxLines: 1,
                                  attribute: 'departmentName',
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
                                        text: "Position Name",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w200,
                                          color: MainColor,
                                        )),
                                  ),
                                ),
                                FormBuilderTextField(
                                  maxLines: 1,
                                  obscureText: false,
                                  attribute: 'positionName',
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
                                        text:
                                            "Excepted Educational Qualification",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w200,
                                          color: MainColor,
                                        )),
                                  ),
                                ),
                                FormBuilderTextField(
                                  maxLines: 1,
                                  obscureText: false,
                                  attribute: 'qualification',
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
                                        text: "Target Industry",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w200,
                                          color: MainColor,
                                        )),
                                  ),
                                ),
                                FormBuilderTextField(
                                  maxLines: 1,
                                  obscureText: false,
                                  attribute: 'targetIndustry',
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
                                        text: "Position Type",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w200,
                                          color: MainColor,
                                        )),
                                  ),
                                ),
                                FormBuilderTextField(
                                  maxLines: 1,
                                  obscureText: false,
                                  attribute: 'positionType',
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
                                        text: "Position Level",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w200,
                                          color: MainColor,
                                        )),
                                  ),
                                ),
                                FormBuilderTextField(
                                  maxLines: 1,
                                  obscureText: false,
                                  attribute: 'positionLevel',
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
                                        text: "Position Location",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w200,
                                          color: MainColor,
                                        )),
                                  ),
                                ),
                                FormBuilderTextField(
                                  maxLines: 1,
                                  obscureText: false,
                                  attribute: 'positionLocation',
                                  validators: [
                                    FormBuilderValidators.required(),
                                  ],
                                  valueTransformer: (value) =>
                                      value.toString().trim(),
                                ),
                                SizedBox(
                                  height: 20,
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
                              ]))),
                    ],
                  ),
                ),
              )),
            ],
          )),
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
          AddPositionScreenTwo(),
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
