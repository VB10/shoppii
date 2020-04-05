import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import './product.dart';
import '../../../core/constants/app.constants.dart';
import '../../../core/model/global_model.dart';
import '../../../core/view/widget/counter/number_counter.dart';
import '../model/product.dart';
import '../service/product_service.dart';

abstract class ProductViewModel extends State<Product> {
  IO.Socket socket = IO.io(AppConstants.SOCKET_URL);

  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  List<ProductModel> products = [];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  // Add your state and logic here
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
        context: context, builder: (context) => modalSheetProduct(index));
  }

  void initSocket() {
    socket.on('connect', (_) {
      // print('connect');
      // socket.emit('msg', 'test');
    });
    socket.on('chat message', (data) => print(data));
    socket.on('disconnect', (_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }

  void onSendSocketMessage(String message) {
    socket.emit(AppConstants.SOCKET_CHANNEL, message);
  }

  Widget modalSheetProduct(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(child: TextField(controller: textEditingController1)),
          NumberCounterWidget(
            value: products[index].total,
            onChange: (val) {
              products[index].total = val;
            },
          ),
          RaisedButton.icon(
              onPressed: () {
                products[index].price =
                    double.tryParse(textEditingController1.text);
                var globalModel =
                    GlobalModel(index: index, model: products[index]);
                onSendSocketMessage(globalModel.toJson());
                Navigator.of(context).pop();
                setState(() {});
                // onSendSocketMessage(message);
              },
              icon: Icon(Icons.update),
              label: Text("Update2"))
        ],
      ),
    );
  }
}
