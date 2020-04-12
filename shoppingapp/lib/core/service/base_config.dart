import 'dart:io';

import 'package:dio/dio.dart';

class BaseConfig {
  Dio dio; // with default Options
  String baseUrl;

  BaseConfig() {
    if (Platform.isIOS) {
      baseUrl = "http://localhost:4000/";
    } else {
      baseUrl = "http://10.0.2.2:4000/";
    }
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      contentType: ContentType.json.value,
    );

    dio = Dio(options);

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // options.headers.
      return options; //continue
    }, onResponse: (Response response) async {
      return response; // continue
    }, onError: (DioError e) async {
      // e.response.statusCode == 401? return "veli"
      return e; //continue
    }));
  }
}
