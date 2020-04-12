import 'package:flutter/material.dart';

class NumberCircleAvatar extends StatelessWidget {
  final int index;

  const NumberCircleAvatar({Key key, this.index = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Text(
        index == 0 ? "" : index.toString(),
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
