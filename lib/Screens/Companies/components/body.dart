import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/assets.dart';
import 'package:leads_in/widgets/CustomAppBar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CompanyList();
  }
}

class CompanyList extends StatefulWidget {
  CompanyList({
    Key key,
  }) : super(key: key);

  @override
  CompanyListState createState() {
    return CompanyListState();
  }
}

class CompanyListState extends State<CompanyList> {
  GlobalKey<ScaffoldState> _key;
  var genderOptions = ['Male', 'Female', 'Other'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Appbar(context),
      body: SetBody(_key, context),
    );
  }

  Widget Appbar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomAppBar(
      height: 195,
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
                        ),
                      ),
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
                          text: "Companies",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 26.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500 // bol
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
    return Container(
      width: size.width,
      color: Colors.grey[100],
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
              key: globalKey,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            text: "Sort By",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500 // bol
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: FormBuilderDropdown(
                            attribute: 'clientName',
                            // initialValue: 'Male',
                            hint: Text('Client Name'),
                            validators: [FormBuilderValidators.required()],
                            items: genderOptions
                                .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text('$gender'),
                                    ))
                                .toList(),
                            // isExpanded: false,
                            allowClear: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Card(
                      child: FormBuilderTypeAhead(
                        decoration: const InputDecoration(
                          labelText: 'Country',
                        ),
                        attribute: 'Company',
                        itemBuilder: (context, country) {
                          return ListTile(
                            title: Text(country),
                          );
                        },
                        controller: TextEditingController(text: ''),
                        initialValue: 'Kenya',
                        suggestionsCallback: (query) {
                          //Search logic
                          /*if (query.isNotEmpty) {
                            var lowercaseQuery = query.toLowerCase();
                            return allCountries.where((country) {
                              return country.toLowerCase().contains(lowercaseQuery);
                            }).toList(growable: false)
                              ..sort((a, b) => a
                                  .toLowerCase()
                                  .indexOf(lowercaseQuery)
                                  .compareTo(
                                  b.toLowerCase().indexOf(lowercaseQuery)));
                          } else {
                            return allCountries;
                          }*/
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print("Card Clicked");
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 00, 10, 10),
                    width: double.maxFinite,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      elevation: 2,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(7),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: Image.asset(
                                      Assets.bank,
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Recruiter Name",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "Joined: ",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Date of join",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: Image.asset(
                                      Assets.bank,
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Company Name",
                                        style: TextStyle(
                                          color: MainColor,
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Company Type",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: Image.asset(
                                      Assets.bank,
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Company Location",
                                        style: TextStyle(
                                          color: MainColor,
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Revenue Generated: ",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "\$10000",
                                            style: TextStyle(
                                              color: MainColor,
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: RichText(
                                      text: TextSpan(
                                        text: "90%",
                                        style: TextStyle(
                                          color: MainColor,
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                child: LinearPercentIndicator(
                                  width: size.width - 70,
                                  lineHeight: 8.0,
                                  percent: 0.9,
                                  progressColor: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
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
}
