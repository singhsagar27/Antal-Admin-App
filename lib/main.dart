import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leads IN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: MainColor,
        canvasColor: Colors.transparent,
      ),
      home: WelcomeScreen(),
      routes: <String, WidgetBuilder>{
        '/LoginScreen': (BuildContext context) => new LoginScreen(),
        '/WelcomeScreen': (BuildContext context) => new WelcomeScreen(),
        '/SignUpScreen': (BuildContext context) => new SignUpScreen(),
        '/PinLoginScreen': (BuildContext context) => new PinLoginScreen(),
        '/DashboardScreen': (BuildContext context) => new DashboardScreen(),
        '/OtpVerificationScreen': (BuildContext context) =>
            new OtpVerificationScreen(),
        '/SetPinScreen': (BuildContext context) => new SetPinScreen(),
        '/AddCompanyScreenOne': (BuildContext context) =>
            new AddCompanyScreenOne(),
        '/AddCompanyScreenTwo': (BuildContext context) =>
            new AddCompanyScreenTwo(),
        '/AddCompanyScreenThree': (BuildContext context) =>
            new AddCompanyScreenThree(),
      },
    );
  }
}
