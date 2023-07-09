import 'package:flutter/material.dart';

import '../../../../core/view/widget/counter/number_counter.dart';
import '../../model/product.dart';

class UpdateProductView extends StatelessWidget {
  final Product product;
  final TextEditingController controller;
  final void Function(Product product) onComplete;

  const UpdateProductView(
      {super.key,
      required this.product,
      required this.controller,
      required this.onComplete});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(child: TextField(controller: controller)),
          NumberCounterWidget(
            value: product.total?.toDouble() ?? 0,
            onChange: (val) {
              // product.total = val;
            },
          ),
          IconButton(
              onPressed: () {
                onComplete(product.copyWith(
                  price: double.tryParse(controller.text),
                ));
              },
              icon: Icon(Icons.update))
        ],
      ),
    );
  }
}
