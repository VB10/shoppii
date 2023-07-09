import 'package:flutter_test/flutter_test.dart';
import 'package:shoppifront/core/service/base_service.dart';
import 'package:shoppifront/core/service/shop_dio.dart';
import 'package:shoppifront/features/product/model/product.dart';

main() {
  setUp(() {});
  final myDio = BaseService().service;

  test('Post Product2', () async {
    final model = Product(
        image: "https://source.unsplash.com/1600x900/?pasta",
        price: 500,
        total: 10,
        title: "Italian Pasta,Granoro Penne R234",
        weight: 400);
    final response = await myDio.make("product",
        parserModel: Product(), data: model, method: MethodType.POST);

    expect(response is Product, true);
  });

  test('Test Product List', () async {
    final response = await myDio.make<Product>("product",
        method: MethodType.GET, parserModel: Product());

    expect(response is List<Product>, true);
  });
}
