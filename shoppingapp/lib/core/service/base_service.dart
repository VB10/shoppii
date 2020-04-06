import 'shop_dio_service.dart';

class BaseService {
  ShoppiDioService service = ShoppiDioService.instance;

  _RoutePath routePath = _RoutePath.instance;
}

class _RoutePath {
  static _RoutePath _instance;

  static _RoutePath get instance {
    if (_instance == null) {
      _instance = _RoutePath._init();
    }
    return _instance;
  }

  _RoutePath._init();

  String get product => "product";
  String get hello => "hello";
}
