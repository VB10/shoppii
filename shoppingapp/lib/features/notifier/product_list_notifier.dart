import 'package:flutter/material.dart';
import 'package:shoppingapp/features/shop/model/product.dart';

class ProductListNotifier extends ChangeNotifier {
  List<Product> productList = [];

  void addProduct(Product product) {
    final elementIndex =
        productList.indexWhere((element) => element == product);
    if (elementIndex == -1) {
      productList.add(product);
    } else {
      if (product.count == 0)
        productList.removeAt(elementIndex);
      else
        productList[elementIndex] = product;
    }
    notifyListeners();
  }
}
