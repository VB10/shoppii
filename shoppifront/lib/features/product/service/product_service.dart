import 'package:shoppifront/core/service/base_service.dart';
import 'package:shoppifront/core/service/shop_dio.dart';

import '../model/product.dart';

class ProductService extends BaseService {
  Future<List<Product>> fetchProducts() async {
    final response = await service.make<Product>("product",
        method: MethodType.GET, parserModel: Product());
    return response is List<Product> ? response : [];
  }

  Future postProduct(Product model) async {
    final response = await service.make(routePath.product,
        parserModel: Product(), data: model, method: MethodType.POST);
    return response;
  }
}
