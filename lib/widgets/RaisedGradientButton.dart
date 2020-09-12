import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;

  final Gradient gradient;
  final double width;
  final double height;
  final bool isEnabled;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.isEnabled,
    this.width,
    this.height,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _statusColor;
    if (isEnabled != null) {
      // Show gradient color by making material widget transparent
      if (isEnabled == true) {
        _statusColor = Colors.transparent;
      } else {
        // Show grey color if isEnabled is false
        _statusColor = Colors.grey;
      }
    } else {
      // Show grey color if isEnabled is null
      _statusColor = Colors.transparent;
    }

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: gradient,
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Colors.white, width: 0.0),
        ),
        color: _statusColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
