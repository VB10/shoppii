import 'package:shoppingapp/core/service/shop_dio_service.dart';

class BaseService {
  ShoppiDioService service = ShoppiDioService.instance;

  _RoutePath routePath = _RoutePath.instance;
}

class _RoutePath {
  _RoutePath._init();
  static _RoutePath? _instance;

  static _RoutePath get instance {
    _instance ??= _RoutePath._init();
    return _instance!;
  }

  String get product => 'product';
  String get hello => 'hello';
}
