
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/PinLogin/component/EnterPinForm.dart';
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
        scaffoldBackgroundColor: PrimaryColor,
      ),
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/LoginScreen': (BuildContext context) => new LoginScreen(),
        '/WelcomeScreen': (BuildContext context) => new WelcomeScreen(),
        '/SignUpScreen': (BuildContext context) => new SignUpScreen(),
        '/PinLoginScreen': (BuildContext context) => new PinLoginScreen(),
        '/DashboardScreen': (BuildContext context) => new DashboardScreen(),
        '/OtpVerificationScreen': (BuildContext context) =>
            new OtpVerificationScreen(),
        '/SetPinScreen': (BuildContext context) => new SetPinScreen(),
        '/AddAdminScreenOne': (BuildContext context) =>
            new AddAdminScreenOne(),
        '/AddAdminScreenTwo': (BuildContext context) =>
            new AddAdminScreenTwo(),
        '/AddAdminScreenThree': (BuildContext context) =>
            new AddAdminScreenThree(),
      },
    );
  }
}
