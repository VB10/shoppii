import 'package:flutter/material.dart';
import 'package:shoppingapp/core/constants/app_strings.dart';
import 'package:shoppingapp/core/view/base/base_stateless.dart';
import 'package:shoppingapp/core/view/widget/card/shopping_circle_card.dart';
import 'package:shoppingapp/features/shop/model/product.dart';

class ShopPaymentCard extends BaseStatelessWidget {
  final Product item;

  ShopPaymentCard({Key key, this.item});
  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return SizedBox(
      height: dynamicHeight(context: context, val: 0.1),
      child: Row(
        children: <Widget>[
          circleImage(currentTheme),
          Spacer(),
          buildExpandedCountNumber(context),
          Spacer(),
          buildExpandedMultiText(context),
          Spacer(),
          buildExpandedTitle(context),
          Spacer(),
          buildExpandedMoney(context),
        ],
      ),
    );
  }

  Expanded buildExpandedMoney(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Text(
        " \$${item.price * item.count}",
        textScaleFactor: 0.8,
        maxLines: 2,
        style: Theme.of(context)
            .primaryTextTheme
            .headline3
            .copyWith(color: Theme.of(context).splashColor),
      ),
    );
  }

  Expanded buildExpandedTitle(BuildContext context) {
    return Expanded(
      flex: 12,
      child: Text(
        item.title,
        maxLines: 2,
        textScaleFactor: 0.8,
        style: Theme.of(context)
            .primaryTextTheme
            .headline3
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildExpandedMultiText(BuildContext context) {
    return Text(
      AppStrings.instance.multi,
      style: Theme.of(context).primaryTextTheme.headline3,
    );
  }

  Widget buildExpandedCountNumber(BuildContext context) {
    return Text(
      item.count.toString(),
      style: Theme.of(context).primaryTextTheme.headline3,
    );
  }

  Widget circleImage(ThemeData currentTheme) => ShoppingCardCircle(
        currentTheme: currentTheme,
        product: item,
        isBadge: false,
      );
}
