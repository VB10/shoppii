import 'package:flutter/material.dart';
import 'package:shoppingapp/core/constants/app_strings.dart';

import 'package:shoppingapp/features/shop/model/product.dart';

class ShoppingCardCircle extends StatelessWidget {
  const ShoppingCardCircle({
    required this.currentTheme,
    required this.product,
    super.key,
    this.index,
    this.isBadge = true,
  });

  final ThemeData currentTheme;
  final Product product;
  final int? index;
  final bool isBadge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: index == null ? buildColumnCircle : buildHeroColumCircle,
    );
  }

  Hero get buildHeroColumCircle {
    return Hero(
      tag: index != null ? AppStrings.instance.subHeroTag(index!) : UniqueKey(),
      child: buildColumnCircle,
    );
  }

  Column get buildColumnCircle => Column(
        children: <Widget>[
          const Spacer(),
          Expanded(
            child: Stack(children: <Widget>[buildCircleImageAvatar(), badge]),
          ),
          const Spacer(),
        ],
      );

  Widget get badge => Visibility(
        visible: product.count != 0 && isBadge,
        child: Positioned(
          top: 0,
          right: 0,
          height: 14,
          width: 14,
          child: CircleAvatar(
            backgroundColor: currentTheme.colorScheme.error,
            child: Text(
              product.count.toString(),
              style: currentTheme.textTheme.titleLarge
                  ?.copyWith(color: currentTheme.canvasColor),
            ),
          ),
        ),
      );

  Widget buildCircleImageAvatar() {
    final imageUrl = product.image;
    if (imageUrl == null) {
      return const SizedBox();
    }
    return CircleAvatar(
      backgroundColor: currentTheme.canvasColor,
      child: Image.network(
        imageUrl,
        height: 20,
        width: 20,
      ),
    );
  }
}
