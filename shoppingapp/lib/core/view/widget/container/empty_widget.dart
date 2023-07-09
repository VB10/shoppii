import 'package:flutter/material.dart';
import 'package:shoppingapp/core/view/base/base_stateless.dart';

class EmptyHeightWidget extends BaseStatelessWidget {
  const EmptyHeightWidget({super.key, this.value});
  final double? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dynamicHeight(context: context, value: value ?? 0.2),
    );
  }
}
