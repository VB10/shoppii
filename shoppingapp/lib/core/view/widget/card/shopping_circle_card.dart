import 'package:flutter/material.dart';
import 'package:shoppingapp/core/constants/app_strings.dart';

import '../../../../features/shop/model/product.dart';

class ShoppingCardCircle extends StatelessWidget {
  const ShoppingCardCircle({
    Key key,
    @required this.currentTheme,
    @required this.product,
    this.index,
    this.isBadge = true,
  }) : super(key: key);

  final ThemeData currentTheme;
  final Product product;
  final int index;
  final bool isBadge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: index == null ? buildColumnCircle : buildHeroColumCircle,
    );
  }

  Hero get buildHeroColumCircle {
    return Hero(
      tag: index != null ? AppStrings.instance.subHeroTag(index) : null,
      child: buildColumnCircle,
    );
  }

  Column get buildColumnCircle => Column(
        children: <Widget>[
          Spacer(),
          Expanded(
              child:
                  Stack(children: <Widget>[buildCircleImageAvatar(), badge])),
          Spacer(),
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
            backgroundColor: currentTheme.errorColor,
            child: Text(
              product.count.toString(),
              style: currentTheme.textTheme.headline6
                  .copyWith(color: currentTheme.canvasColor),
            ),
          ),
        ),
      );

  CircleAvatar buildCircleImageAvatar() {
    return CircleAvatar(
      backgroundColor: currentTheme.canvasColor,
      child: Image.network(
        product.image,
        height: 20,
        width: 20,
      ),
    );
  }
}
