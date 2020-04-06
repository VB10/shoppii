import 'package:flutter/material.dart';
import 'package:shoppingapp/core/view/base/base_stateless.dart';

class EmptyHeightWidget extends BaseStatelessWidget {
  final double val;

  EmptyHeightWidget({this.val});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dynamicHeight(context: context, val: val ?? 0.2),
    );
  }
}
