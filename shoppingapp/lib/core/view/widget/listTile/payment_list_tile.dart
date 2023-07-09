import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:shoppingapp/core/constants/app_constants.dart';
import 'package:shoppingapp/core/constants/app_strings.dart';

class PaymentListTile extends StatelessWidget {
  const PaymentListTile({super.key, required this.totalMoney});
  final int totalMoney;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: buildCarCircleAvatar(context),
      title: buildTextDelivery(context),
      trailing: buildTextMoney(context),
      subtitle: Row(
        children: <Widget>[
          Expanded(flex: 2, child: buildDeliveryBodyColumn(context)),
          const Spacer(),
        ],
      ),
    );
  }

  Text buildTextMoney(BuildContext context) {
    return Text(
      '\$${AppConstants.FREE_DELIVERY_MONEY}',
      style: Theme.of(context)
          .primaryTextTheme
          .headlineMedium
          ?.copyWith(color: Theme.of(context).splashColor),
    );
  }

  Text buildTextDelivery(BuildContext context) {
    return Text(
      AppStrings.instance.delivery,
      style: Theme.of(context).primaryTextTheme.displaySmall,
    );
  }

  CircleAvatar buildCarCircleAvatar(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).splashColor,
      child: Icon(
        FontAwesomeIcons.car,
        color: Theme.of(context).primaryColorDark,
      ),
    );
  }

  Column buildDeliveryBodyColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        buildExpandedFreeText(context),
        buildLinearProgressIndicator(context),
      ],
    );
  }

  LinearProgressIndicator buildLinearProgressIndicator(BuildContext context) {
    return LinearProgressIndicator(
      value: indicatorValue,
      backgroundColor: Theme.of(context).splashColor,
      valueColor:
          AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColorDark),
    );
  }

  Expanded buildExpandedFreeText(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Text(
        AppStrings.instance.orderFree,
        style: Theme.of(context)
            .primaryTextTheme
            .headlineSmall
            ?.copyWith(color: Theme.of(context).splashColor),
      ),
    );
  }

  double get indicatorValue => totalMoney / AppConstants.FREE_DELIVERY_MONEY;
}
