import 'package:flutter/cupertino.dart';
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
      print(model);

      final index =
          productList.indexWhere((element) => element.sId == model.sId);
      if (index != -1) {
        productList[index] = model;
      }

      notifyListeners();
    });
  }

  void sendMessage() {
    socket.emit('chat message', 'test');
  }
}
