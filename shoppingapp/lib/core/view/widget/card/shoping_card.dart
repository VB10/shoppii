import 'package:flutter/material.dart';
import 'package:shoppingapp/core/view/base/base_stateless.dart';
import 'package:shoppingapp/features/shop/model/product.dart';

class ShoppingCard extends BaseStatelessWidget {
  const ShoppingCard({required this.product, super.key, this.padding});
  final Product product;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(dynamicWidth(context: context, value: 0.04)),
        ),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildExpandedImage(),
            buildText(currentTheme),
            SizedBox(height: height * 0.01),
            buildTitleText(currentTheme),
            SizedBox(height: height * 0.005),
            buildWeightText(currentTheme)
          ],
        ),
      ),
    );
  }

  Text buildWeightText(ThemeData currentTheme) {
    return Text(
      '${product.weight} g',
      style: currentTheme.textTheme.titleLarge
          ?.copyWith(fontWeight: FontWeight.w300),
    );
  }

  Text buildTitleText(ThemeData currentTheme) {
    return Text(
      product.title ?? '',
      maxLines: 2,
      style: currentTheme.textTheme.titleLarge,
    );
  }

  Text buildText(ThemeData currentTheme) {
    return Text(
      '\$ ${product.price}',
      style: currentTheme.textTheme.headlineMedium
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Expanded buildExpandedImage() {
    if (product.image == null) {
      return const Expanded(
        child: Center(
          child: Icon(Icons.error),
        ),
      );
    }
    return Expanded(
      child: Center(
        child: AspectRatio(
          aspectRatio: 1 / 3,
          child: Image.network(product.image!),
        ),
      ),
    );
  }
}
