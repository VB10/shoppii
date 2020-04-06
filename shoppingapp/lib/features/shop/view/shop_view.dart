import 'package:flutter/material.dart';
import 'package:shoppingapp/core/constants/enums/page_view_enums.dart';

import '../../../core/view/base/base_state.dart';
import '../model/product.dart';
import 'shop_list_view.dart';
import 'shop_payment.dart';

class ShopView extends StatefulWidget {
  @override
  _ShopViewState createState() => _ShopViewState();
}

class _ShopViewState extends BaseState<ShopView> {
  List<Product> subList = [];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentTheme.primaryColor,
      body: PageView(
        controller: PageController(viewportFraction: pageViewHeight),
        onPageChanged: (value) => onPageChanged(value),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ShopListView(isUserOnPage: isShopPage),
          ShopPaymentView()
        ],
      ),
    );
  }

  bool get isShopPage => currentPage == PageViews.PRODUCT_LIST.index;

  void onPageChanged(int val) {
    setState(() {
      currentPage = val;
    });
  }

  double get pageViewHeight => currentPage == 1 ? 0.8 : 1;
}
