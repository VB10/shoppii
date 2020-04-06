import 'package:flutter/material.dart';

import '../../../../core/view/widget/counter/number_counter.dart';
import '../../model/product.dart';

class UpdateProductView extends StatelessWidget {
  final ProductModel product;
  final TextEditingController controller;
  final Function(ProductModel product) onComplete;

  const UpdateProductView(
      {Key key,
      @required this.product,
      @required this.controller,
      this.onComplete})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(child: TextField(controller: controller)),
          NumberCounterWidget(
            value: product.total,
            onChange: (val) {
              product.total = val;
            },
          ),
          RaisedButton.icon(
              onPressed: () {
                product.price = double.tryParse(controller.text);
                onComplete(product);
              },
              icon: Icon(Icons.update),
              label: Text("Update"))
        ],
      ),
    );
  }
}
