import 'package:flutter/material.dart';
import 'package:shoppingapp/core/view/base/base_stateless.dart';

class EmptyWidthWidget extends BaseStatelessWidget {
  final double value;

  EmptyWidthWidget(this.value);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dynamicWidth(context: context, value: value ?? 0.2),
    );
  }
}
