import 'package:flutter/material.dart';
import 'package:shoppifront/core/base/base_state.dart';

class NumberPicker extends StatefulWidget {
  final int number;
  final void Function(int value) onChanged;
  final int maxValue;
  final int minValue;

  const NumberPicker(
      {super.key,
      required this.number,
      required this.onChanged,
      this.maxValue = 100,
      this.minValue = 0});
  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends BaseState<NumberPicker> {
  int number = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      number =
          widget.number > widget.minValue ? widget.number : widget.minValue;
      setState(() {});
    });
  }

  ShapeDecoration get shapeDecoration => ShapeDecoration(
      shape: StadiumBorder(
          side: BorderSide(color: Theme.of(context).highlightColor)));

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        deIncerement,
        Text(
          "$number",
          style: currentTheme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: currentTheme.colorScheme.onSurface),
        ),
        incerement
      ],
    );
  }

  IconButton get deIncerement => IconButton(
      icon: Icon(Icons.remove),
      onPressed: () {
        number -= number > widget.minValue ? 1 : 0;
        updateNumber();
      });

  IconButton get incerement => IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        number += number <= widget.maxValue ? 1 : 0;
        updateNumber();
      });

  void updateNumber() {
    setState(() {});
    widget.onChanged(number);
  }
}
