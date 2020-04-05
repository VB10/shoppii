import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BaseConfig {
  Dio dio; // with default Options
  final String baseUrl = "http://localhost:4000/";
  _parseAndDecode(String response) {
    return jsonDecode(response);
  }

  parseJson(String text) {
    return compute(_parseAndDecode, text);
  }

  BaseConfig() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      // connectTimeout: 5000,
      // receiveTimeout: 3000,
      contentType: ContentType.json.value,
      // responseDecoder:
    );

    dio = Dio(options);
    // (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    // dio.interceptors
    //     .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    //   return options; //continue
    // }, onResponse: (Response response) async {
    //   return response; // continue
    // }, onError: (DioError e) async {
    //   return e; //continue
    // }));
  }
}
