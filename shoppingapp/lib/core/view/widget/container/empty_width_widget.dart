import 'package:flutter/material.dart';
import 'package:shoppingapp/core/view/base/base_stateless.dart';

class EmptyWidthWidget extends BaseStatelessWidget {
  final double val;

  EmptyWidthWidget(this.val);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dynamicWidth(context: context, val: val ?? 0.2),
    );
  }
}
