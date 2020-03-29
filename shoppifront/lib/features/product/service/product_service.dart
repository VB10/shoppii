import 'package:fireball/fireball.dart';
import 'package:fireball/network/local/local_preferences.dart';
import 'package:shoppifront/features/product/model/product.dart';

class ProductService {
  NetworkManager manager;

  ProductService() {
    final config = NetworkConfig(
        baseUrl: "http://localhost:4000", fileManager: LocalPreferences());
    manager = NetworkManager(config: config);
  }
  Future fetchProductList() async {
    if (manager == null) {}

    print(manager.config.baseUrl);
    final response = await manager.get<ProductModel>("/product",
        responseType: ProductModel());

    if (response is ErrorModel) {
      print(response);
      print(response.raw);
    }
    return response;
  }
}
