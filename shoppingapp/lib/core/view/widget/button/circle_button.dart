import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircleIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const CircleIconButton({Key key, this.onPressed, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: this.onPressed,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(icon ?? FontAwesomeIcons.heart),
      ),
      shape: CircleBorder(),
    );
  }
}
