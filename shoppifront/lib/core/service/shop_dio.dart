import 'dart:convert';

import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import 'base_model.dart';

class ShoppiDio with DioMixin implements Dio {
  ShoppiDio._init() {
    String baseUrl = 'http://localhost:4000/';

    options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    httpClientAdapter = BrowserHttpClientAdapter();
    interceptors.add(LogInterceptor(responseBody: true));
  }

  static ShoppiDio? _instance;

  static ShoppiDio get instance {
    _instance ??= ShoppiDio._init();
    return _instance!;
  }

  Future<dynamic> make<T extends BaseModel>(
    String path, {
    required T parserModel,
    required MethodType method,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    dynamic data,
    ProgressCallback? onReceiveProgress,
  }) async {
    final options = Options();
    options.method = getMethodType(method);
    final body = getBodyModel(data);

    try {
      final response = await request(path, data: body, options: options);
      return parseBody<T>(response.data, parserModel);
    } on DioException catch (e) {
      return onError(e);
    }
  }

  String getMethodType(MethodType type) {
    switch (type) {
      case MethodType.GET:
        return 'GET';
      case MethodType.POST:
        return 'POST';
    }
  }

  dynamic getBodyModel(dynamic data) {
    if (data == null) {
      return data;
    } else if (data is BaseModel) {
      return data.toJson();
    } else if (data is String) {
      return jsonDecode(data);
    }

    return null;
  }

  dynamic parseBody<T extends BaseModel>(dynamic responseBody, T model) {
    try {
      if (responseBody is List) {
        return responseBody
            .map((data) => model.fromJson(data))
            .cast<T>()
            .toList();
      } else if (responseBody is Map<String, Object>) {
        return model.fromJson(responseBody) as T;
      } else {
        return responseBody;
      }
    } catch (e) {
      return responseBody;
    }
  }

  String onError(DioException error) {
    return 'Error';
  }
}

enum MethodType {
  GET,
  POST,
}
