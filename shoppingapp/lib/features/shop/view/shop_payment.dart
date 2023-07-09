import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/core/constants/app_strings.dart';
import 'package:shoppingapp/core/view/base/base_state.dart';
import 'package:shoppingapp/core/view/widget/card/shop_payment_card.dart';
import 'package:shoppingapp/core/view/widget/listTile/payment_list_tile.dart';
import 'package:shoppingapp/core/view/widget/lottie/not_found.dart';
import 'package:shoppingapp/features/notifier/product_list_notifier.dart';
import 'package:shoppingapp/features/shop/model/product.dart';

class ShopPaymentView extends StatefulWidget {
  const ShopPaymentView({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Spacer(),
          cartTitle(),
          buildExpandedShopList(),
          buildDeliveryCard(),
          const Spacer(),
          buildMoneyTotalCard(context),
          const Spacer(),
          buildNextButton(context),
        ],
      ),
    );
  }

  //1

  Text cartTitle() {
    return Text(
      AppStrings.instance.paymentTitle,
      style: currentTheme.primaryTextTheme.displayLarge,
      textScaleFactor: 1.5,
    );
  }

// 2
  Expanded buildDeliveryCard() => Expanded(
        child: PaymentListTile(totalMoney: sumMoneyAll.toInt()),
      );

  SizedBox buildNextButton(BuildContext context) {
    return SizedBox(
      width: dynamicWidth(1),
      height: dynamicHeight(0.07),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        onPressed: () {},
        child: Text(
          AppStrings.instance.next,
          style: currentTheme.textTheme.displaySmall,
        ),
      ),
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
                .displayMedium
                ?.copyWith(fontWeight: FontWeight.w200),
          ),
        ),
        Text(
          '\$$sumMoneyAll',
          maxLines: 1,
          style: Theme.of(context).primaryTextTheme.displayLarge,
        ),
      ],
    );
  }

  double get sumMoneyAll => currentProductList.fold(
        0,
        (previousValue, element) =>
            previousValue + ((element.price ?? 0) * (element.count ?? 0)),
      );

  Expanded buildExpandedShopList() => Expanded(
        flex: 4,
        child: currentProductList.isEmpty
            ? notFoundLottie
            : ListView.builder(
                itemCount: currentProductList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    ShopPaymentCard(item: currentProductList[index]),
              ),
      );

  Widget get notFoundLottie =>
      Center(child: AspectRatio(aspectRatio: 4 / 5, child: NotFoundLottie()));
}
