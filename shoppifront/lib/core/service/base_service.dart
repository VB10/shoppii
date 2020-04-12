import 'package:shoppifront/core/service/shop_dio.dart';

part './service_constants.dart';

class BaseService {
  ShoppiDio service = ShoppiDio.instance;

  _RoutePath routePath = _RoutePath.instance;
}
