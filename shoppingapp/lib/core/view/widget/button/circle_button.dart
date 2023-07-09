import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({super.key, this.onPressed, this.icon});
  final VoidCallback? onPressed;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        side: BorderSide(color: Theme.of(context).primaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Icon(icon ?? FontAwesomeIcons.heart),
      ),
    );
  }
}
