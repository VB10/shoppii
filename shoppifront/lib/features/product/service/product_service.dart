import 'package:shoppifront/core/service/base_service.dart';
import 'package:shoppifront/core/service/shop_dio.dart';

import '../model/product.dart';

class ProductService extends BaseService {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await service.make<ProductModel>("product",
        method: MethodType.GET, parserModel: ProductModel());
    return response;
  }

  Future postProduct(ProductModel model) async {
    final response = await service.make(routePath.product,
        parserModel: ProductModel(), data: model, method: MethodType.POST);
    return response;
  }
}
