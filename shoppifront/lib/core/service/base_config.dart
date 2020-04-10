// import 'dart:io';

import 'package:dio/dio.dart';

class BaseConfig {
  Dio dio; // with default Options
  final String baseUrl = "http://localhost:4000/";

  BaseConfig() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
    );

    dio = Dio(options);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      return options; //continue
    }, onResponse: (Response response) async {
      return response; // continue
    }, onError: (DioError e) async {
      return e; //continue
    }));
  }
}
