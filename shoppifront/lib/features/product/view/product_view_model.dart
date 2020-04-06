import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import './product.dart';
import '../../../core/base/base_state.dart';
import '../../../core/constants/app.constants.dart';
import '../../../core/model/global_model.dart';
import '../model/product.dart';
import '../service/product_service.dart';
import 'fields/update_product_view.dart';

abstract class ProductViewModel extends BaseState<Product> {
  IO.Socket socket = IO.io(AppConstants.SOCKET_URL);

  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  List<ProductModel> products = [];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  ProductService service = ProductService();

  @override
  void initState() {
    super.initState();
    initSocket();
  }

  Future<List<ProductModel>> fetchAllDatas() async {
    if (products.isEmpty) {
      products = await service.fetchProducts();
    }
    return products;
  }

  Future onCompleteForm(ProductModel model) async {
    final response = await service.postProduct(model);
    if (response is ProductModel) {
      products = await service.fetchProducts();
      setState(() {});
    } else {
      final body = jsonEncode(response);
      final jsonModel = jsonDecode(body);
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(jsonModel['message'])));
    }
  }

  void showProductSheet(int index) {
    textEditingController1.text = products[index].price.toString();
    showModalBottomSheet(
        context: context,
        builder: (context) => UpdateProductView(
              product: products[index],
              controller: textEditingController1,
              onComplete: (product) {
                var globalModel = GlobalModel(index: index, model: product);
                onSendSocketMessage(globalModel.toJson());
                Navigator.of(context).pop();
                setState(() {});
              },
            ));
  }

  void initSocket() {
    socket.on('connect', (_) {});
    socket.on('disconnect', (_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }

  void onSendSocketMessage(String message) {
    socket.emit(AppConstants.SOCKET_CHANNEL, message);
  }
}
