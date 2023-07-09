import 'package:shoppingapp/core/service/base_service.dart';
import 'package:shoppingapp/core/service/shop_dio_service.dart';
import 'package:shoppingapp/features/shop/model/product.dart';

class ProductService extends BaseService {
  Future<List<Product>> fetchProducts() async {
    final response = await service.make<Product>(
      routePath.product,
      parserModel: Product(),
      method: MethodType.GET,
    );
    return response is List<Product> ? response : <Product>[];
  }
}
