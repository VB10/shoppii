import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/core/view/widget/lottie/not_found.dart';
import 'package:shoppingapp/features/notifier/product_list_notifier.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/view/base/base_state.dart';
import '../../../core/view/widget/card/shop_payment_card.dart';
import '../../../core/view/widget/listTile/payment_list_tile.dart';
import '../model/product.dart';

class ShopPaymentView extends StatefulWidget {
  @override
  _ShopPaymentViewState createState() => _ShopPaymentViewState();
}

class _ShopPaymentViewState extends BaseState<ShopPaymentView> {
  int totalMoney = 0;
  List<Product> get currentProductList =>
      Provider.of<ProductListNotifier>(context, listen: false).productList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.08)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          cartTitle(),
          buildExpandedShopList(),
          buildDeliveryCard(),
          Spacer(),
          buildMoneyTotalCard(context),
          Spacer(),
          buildNextButton(context),
        ],
      ),
    );
  }

  //1

  Text cartTitle() {
    return Text(
      AppStrings.instance.paymentTitle,
      style: currentTheme.primaryTextTheme.headline1,
      textScaleFactor: 1.5,
    );
  }

// 2
  Expanded buildDeliveryCard() => Expanded(
      flex: 1, child: PaymentListTile(totalMoney: sumMoneyAll.toInt()));

  SizedBox buildNextButton(BuildContext context) {
    return SizedBox(
      width: dynamicWidth(1),
      height: dynamicHeight(0.07),
      child: RaisedButton(
          shape: StadiumBorder(),
          color: Theme.of(context).primaryColorDark,
          onPressed: () {},
          child: Text(AppStrings.instance.next,
              style: currentTheme.textTheme.headline3)),
    );
  }

  Row buildMoneyTotalCard(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            AppStrings.instance.total,
            style: Theme.of(context)
                .primaryTextTheme
                .headline2
                .copyWith(fontWeight: FontWeight.w200),
          ),
        ),
        Text(
          "\$$sumMoneyAll",
          maxLines: 1,
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
      ],
    );
  }

  double get sumMoneyAll => currentProductList.fold(
      0,
      (previousValue, element) =>
          previousValue + (element.price * element.count));

  Expanded buildExpandedShopList() => Expanded(
      flex: 4,
      child: currentProductList.isEmpty
          ? notFoundLottie
          : ListView.builder(
              itemCount: currentProductList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  ShopPaymentCard(item: currentProductList[index]),
            ));

  Widget get notFoundLottie =>
      Center(child: AspectRatio(aspectRatio: 4 / 5, child: NotFoundLottie()));
}
