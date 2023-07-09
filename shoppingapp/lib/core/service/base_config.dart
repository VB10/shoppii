import 'dart:io';

import 'package:dio/dio.dart';

class BaseConfig {
  BaseConfig() {
    String baseUrl;
    if (Platform.isIOS) {
      baseUrl = 'http://localhost:4000/';
    } else {
      baseUrl = 'http://10.0.2.2:4000/';
    }
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      contentType: ContentType.json.value,
    );

    dio = Dio(options);
  }
  late final Dio dio;
}



    // dio.interceptors
    //     .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    //   // options.headers.
    //   return options; //continue
    // }, onResponse: (Response response) async {
    //   return response; // continue
    // }, onError: (DioError e) async {
    //   // e.response.statusCode == 401? return "veli"
    //   return e; //continue
    // }));
