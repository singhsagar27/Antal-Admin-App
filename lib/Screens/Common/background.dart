import 'package:flutter/material.dart';
import 'package:leads_in/assets.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                      child: Image.asset(
                        Assets.otherPageLogo,
                        width: size.width * 0.50,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  child,
                ],
              ),
            ),
          ));
        }));
  }
}
