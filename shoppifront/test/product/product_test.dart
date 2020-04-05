import 'package:flutter_test/flutter_test.dart';
import 'package:shoppifront/features/product/model/product.dart';

import '../mock/mock_service.dart';

main() {
  MockBaseService base;
  setUp(() {
    base = MockBaseService();
  });
  test('Test Product List', () async {
    // final response = await manager.get<ProductModel>(
    //     "http://localhost:4000/product",
    //     responseType: ProductModel());

    // expect(response.data is List<ProductModel>, true);
  });

  test('Post Product', () async {
    final model = ProductModel(
        image: "https://source.unsplash.com/1600x900/?pasta",
        price: 500,
        total: 10,
        title: "Italian Pasta,Granoro Penne R",
        weight: 400);
    final response = await base.service.post<ProductModel, ProductModel>(
        '/product',
        responseModel: model,
        body: model);

    expect(response is ProductModel, true);
  });
}
