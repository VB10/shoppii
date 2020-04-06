import 'package:flutter/material.dart';
import 'package:shoppingapp/core/view/base/base_state.dart';

class NumberPicker extends StatefulWidget {
  final int number;
  final Function(int value) onChanged;
  final int maxValue;
  final int minValue;

  const NumberPicker(
      {Key key,
      @required this.number,
      this.onChanged,
      this.maxValue = 100,
      this.minValue = 0})
      : super(key: key);
  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends BaseState<NumberPicker> {
  int number;

  @override
  void initState() {
    super.initState();
    number = widget.number ?? 0;
  }

  ShapeDecoration get shapeDecoration => ShapeDecoration(
      shape: StadiumBorder(
          side: BorderSide(color: Theme.of(context).highlightColor)));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shapeDecoration,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          deIncerement,
          Text(
            "$number",
            style: currentTheme.textTheme.headline4.copyWith(
                fontWeight: FontWeight.bold,
                color: currentTheme.colorScheme.onSurface),
          ),
          incerement
        ],
      ),
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
