import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/screens.dart';
import 'package:leads_in/assets.dart';
import 'package:leads_in/models/admin_company.dart';
import 'package:leads_in/services/auth_service.dart';
import 'package:leads_in/widgets/CustomAppBar.dart';
import 'package:leads_in/widgets/StepsIndicator.dart';

class AddAdminScreenOne extends StatefulWidget {
  AddAdminScreenOne({
    Key key,
  }) : super(key: key);

  @override
  _RegisterCompanyState createState() => _RegisterCompanyState();
}

class _RegisterCompanyState extends State<AddAdminScreenOne> {
  FocusNode _focusNode;
  var genderOptions = ['Male', 'Female', 'Other'];
  GlobalKey<FormBuilderState> _fbKey;

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
  void initState() {
    _fbKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(context),
      body: SetBody(_fbKey, context),
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
                              Navigator.of(context).push(_createRegisterCompanyRoute());
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
        "Save and Next",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget Appbar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomAppBar(
        height: 260,
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
                              text: "Sign Up",
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
                              text: "1. Basic Information",
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

  Widget SetBody(GlobalKey<FormBuilderState> _fbKey, BuildContext context) {
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
                    key: _fbKey,
                    child: Padding(
                      padding: new EdgeInsets.only(
                          left: size.width * 0.10,
                          right: size.width * 0.10,
                          top: size.height * 0.05,
                          bottom: size.height * 0.05),
                      child: Column(
                        children: <Widget>[
                          
                          FormBuilderTextField(
                            decoration: InputDecoration(
                                  labelText: 'Billing Address',
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
                            height: 20,
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
                            height: 20,
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
                            height: 20,
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
