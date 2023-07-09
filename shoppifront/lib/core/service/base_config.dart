// import 'dart:io';

import 'package:dio/dio.dart';

class BaseConfig {
  late final Dio dio; // with default Options
  final String baseUrl = "http://localhost:4000/";

  BaseConfig() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
    );

    dio = Dio(options);
  }
}
