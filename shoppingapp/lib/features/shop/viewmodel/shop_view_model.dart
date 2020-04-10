import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/features/notifier/product_list_notifier.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../core/base/base_view_model.dart';
import '../../../core/constants/app_constants.dart';
import '../model/product.dart';
import '../service/product_service.dart';

class ShopViewModel extends BaseViewModel with ChangeNotifier {
  // IO.Socket socket = IO.io(AppConstants.SOCKET_URL);

  IO.Socket socket = IO.io(AppConstants.SOCKET_URL, <String, dynamic>{
    'transports': ['websocket'],
    // 'extraHeaders': {'foo': 'bar'} // optional
  });

  ProductService service = ProductService();
  List<Product> subList = [];
  List<Product> productList = [];

  Future<List<Product>> getAllProduct() async {
    final list = await service.fetchProducts();
    productList = list;
    return list;
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
    initSocket();
  }

  void initSocket() {
    socket.connect().on(AppConstants.SOCKET_CHANNEL_DELIVERY, (data) {
      // var jsonModel = jsonDecode(data);
      var model = Product.fromJson(data);
      final index = productList
          .indexWhere((element) => element.sId == data[AppConstants.S_ID]);
      if (index != -1) {
        productList[index] = model;
      }
      Provider.of<ProductListNotifier>(context, listen: false)
          .addProduct(model);

      notifyListeners();
    });
  }

  void sendMessage() {
    socket.emit('chat message', 'test');
  }
}
