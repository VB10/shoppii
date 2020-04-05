import 'base_network.dart';

part './service-helper/service_constants.dart';

class BaseService {
  BaseNetwork service = BaseNetwork.instance;

  _RoutePath routePath = _RoutePath.instance;
}
