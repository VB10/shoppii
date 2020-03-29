import 'package:fireball/fireball.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shoppifront/features/product/model/product.dart';

main() {
  NetworkManager manager;
  setUp(() {
    manager = NetworkManager();
  });
  test('Test Product List', () async {
    final response = await manager.get<ProductModel>(
        "http://localhost:4000/product",
        responseType: ProductModel());

    expect(response.data is List<ProductModel>, true);
  });
}
