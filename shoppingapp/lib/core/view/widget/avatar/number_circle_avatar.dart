import 'package:flutter/material.dart';

class NumberCircleAvatar extends StatelessWidget {
  const NumberCircleAvatar({super.key, this.index = 0});
  final int index;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Text(
        index == 0 ? '' : index.toString(),
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
