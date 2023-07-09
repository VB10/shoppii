import 'package:flutter_test/flutter_test.dart';
import 'package:shoppingapp/core/service/shop_dio_service.dart';

main() {
  ShoppiDioService service;

  setUp(() {
    service = ShoppiDioService.instance;
  });
  test('get products', () async {
    // final response = await service.make<Product>(
    //   "product",
    //   method: MethodType.GET,
    //   parserModel: Product(),
    //   onReceiveProgress: (count, total) {
    //     print("$count - $total");
    //   },
    // );

    // expect(response is List<Product>, true);
  });
}
