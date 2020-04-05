import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'base_config.dart';
import 'base_model.dart';

part './service-helper/service_helper.dart';
part './service-helper/service_request.dart';

class BaseNetwork {
  static BaseNetwork _instance;
  Dio _dio;

  static BaseNetwork get instance {
    if (_instance == null) {
      _instance = BaseNetwork._init();
    }
    return _instance;
  }

  BaseNetwork._init() {
    _dio = BaseConfig().dio;
  }

  Future get<T extends BaseModel>(
    String path, {
    @required T responseModel,
    Function(int count, int total) onReceiveProgress,
    Map<String, dynamic> querys,
  }) async {
    return await _get<T>(path,
        responseModel: responseModel, onReceiveProgress: onReceiveProgress);
  }

  Future post<T extends BaseModel, R extends BaseModel>(
    String path, {
    @required T responseModel,
    @required R body,
    Function(int count, int total) onReceiveProgress,
    Map<String, dynamic> querys,
  }) async {
    return await _post<T, R>(path,
        data: body,
        responseModel: responseModel,
        onReceiveProgress: onReceiveProgress);
  }
}
