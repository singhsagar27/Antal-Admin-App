import 'package:flutter/material.dart';
import 'package:leads_in/Palette.dart';
import 'package:leads_in/Screens/Common/form_background.dart';
import 'package:leads_in/Screens/Common/form_title.dart';
import '../../../assets.dart';
import 'Dashboard.dart';

import '../../Common/background.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(150.0),
            child: AppBar(
              elevation: 0.0,
              actions: <Widget>[
                Container(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'JIMMY FELLON',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'PROJECT OWNER',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    )),
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(Assets.profile),
                          backgroundColor: Colors.transparent,
                          radius: 24.0,
                        ),
                      ]),
                ),
                IconButton(
                  icon: new Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            )),
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: new EdgeInsets.only(
                          left: size.width * 0.10,
                          right: size.width * 0.10,
                          top: size.height * 0.10),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Dashboard(),
                ],
              ),
            ),
          ));
        }));
  }
}
