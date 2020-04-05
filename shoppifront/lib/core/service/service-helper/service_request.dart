part of '../base_network.dart';

extension _ServiceRequest on BaseNetwork {
  Future _get<T extends BaseModel>(
    String path, {
    @required T responseModel,
    Function(int count, int total) onReceiveProgress,
    Map<String, dynamic> querys,
  }) async {
    final response = await _dio.get(path, queryParameters: querys,
        onReceiveProgress: (count, total) {
      if (onReceiveProgress != null) onReceiveProgress(count, total);
    });

    return parseBody(response.data, responseModel);
  }

  Future _post<T extends BaseModel, R extends BaseModel>(
    String path, {
    @required T responseModel,
    @required R data,
    Function(int count, int total) onReceiveProgress,
    Map<String, dynamic> querys,
  }) async {
    try {
      // var jsonBody = json
      final response = await _dio.post(path,
          data: data.toJson(),
          queryParameters: querys, onReceiveProgress: (count, total) {
        if (onReceiveProgress != null) onReceiveProgress(count, total);
      });

      return parseBody(response.data, responseModel);
    } on DioError catch (e) {
      return e.response.data;
    }
  }
}
