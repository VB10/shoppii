import '../../../core/service/base_service.dart';
import '../model/product.dart';

class ProductService extends BaseService {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await service.get<ProductModel>(routePath.product,
        responseModel: ProductModel());

    return response;
  }

  Future postProduct(ProductModel model) async {
    final response = await service.post(routePath.product,
        responseModel: model, body: model);
    return response;
  }
}
