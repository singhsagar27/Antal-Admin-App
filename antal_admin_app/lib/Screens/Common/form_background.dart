import 'package:flutter/material.dart';

class FormBackground extends StatelessWidget {
  final Widget child;

  const FormBackground({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(30.0),
            topRight: const Radius.circular(30.0),
          )),
      child: child,
    );
  }
}
