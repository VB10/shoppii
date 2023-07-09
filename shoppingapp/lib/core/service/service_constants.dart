part of '../base_service.dart';

class _RoutePath {
  const _RoutePath._init();

  static _RoutePath? _instance;

  static _RoutePath get instance {
    _instance ??= _RoutePath._init();
    return _instance!;
  }

  String get product => "product";
}
