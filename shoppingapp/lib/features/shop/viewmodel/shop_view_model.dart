import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/core/base/base_view_model.dart';
import 'package:shoppingapp/core/constants/app_constants.dart';
import 'package:shoppingapp/features/notifier/product_list_notifier.dart';
import 'package:shoppingapp/features/shop/model/product.dart';
import 'package:shoppingapp/features/shop/service/product_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

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
      if (data is! Map<String, dynamic>) return;
      final model = Product.fromJson(data);
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
