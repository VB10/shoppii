import 'package:flutter/material.dart';

class NumberCounterWidget extends StatefulWidget {
  final double value;
  final Function(double val) onChange;

  const NumberCounterWidget({
    super.key,
    required this.value,
    required this.onChange,
  });

  @override
  _NumberCounterWidgetState createState() => _NumberCounterWidgetState();
}

class _NumberCounterWidgetState extends State<NumberCounterWidget> {
  double val = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    val = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildEmptyWidget,
        IconButton(icon: Icon(Icons.add), onPressed: () => valueChanged(true)),
        Text(val.toString()),
        IconButton(
            icon: Icon(Icons.remove), onPressed: () => valueChanged(false)),
        _buildEmptyWidget
      ],
    );
  }

  SizedBox get _buildEmptyWidget => SizedBox(width: 10);

  void valueChanged(bool val) {
    if (val) {
      this.val++;
    } else {
      this.val--;
    }
    widget.onChange(this.val);
    setState(() {});
  }
}
