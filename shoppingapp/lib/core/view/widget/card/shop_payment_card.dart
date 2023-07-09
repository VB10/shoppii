import 'package:flutter/material.dart';
import 'package:shoppingapp/core/constants/app_strings.dart';
import 'package:shoppingapp/core/view/base/base_stateless.dart';
import 'package:shoppingapp/core/view/widget/card/shopping_circle_card.dart';
import 'package:shoppingapp/features/shop/model/product.dart';

class ShopPaymentCard extends BaseStatelessWidget {
  const ShopPaymentCard({required this.item, super.key});
  final Product item;
  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return SizedBox(
      height: dynamicHeight(context: context, value: 0.1),
      child: Row(
        children: <Widget>[
          circleImage(currentTheme),
          const Spacer(),
          buildExpandedCountNumber(context),
          const Spacer(),
          buildExpandedMultiText(context),
          const Spacer(),
          if (item.title?.isNotEmpty ?? false)
            buildExpandedTitle(context, item.title!),
          const Spacer(),
          buildExpandedMoney(context),
        ],
      ),
    );
  }

  Expanded buildExpandedMoney(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Text(
        ' \$${(item.price ?? 0) * (item.count ?? 0)}',
        textScaleFactor: 0.8,
        maxLines: 2,
        style: Theme.of(context)
            .primaryTextTheme
            .displaySmall
            ?.copyWith(color: Theme.of(context).splashColor),
      ),
    );
  }

  Expanded buildExpandedTitle(BuildContext context, String title) {
    return Expanded(
      flex: 12,
      child: Text(
        title,
        maxLines: 2,
        textScaleFactor: 0.8,
        style: Theme.of(context)
            .primaryTextTheme
            .displaySmall
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildExpandedMultiText(BuildContext context) {
    return Text(
      AppStrings.instance.multi,
      style: Theme.of(context).primaryTextTheme.displaySmall,
    );
  }

  Widget buildExpandedCountNumber(BuildContext context) {
    return Text(
      item.count.toString(),
      style: Theme.of(context).primaryTextTheme.displaySmall,
    );
  }

  Widget circleImage(ThemeData currentTheme) => ShoppingCardCircle(
        currentTheme: currentTheme,
        product: item,
        isBadge: false,
      );
}
