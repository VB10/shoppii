part of '../base_service.dart';

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
