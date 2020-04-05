part of '../base_network.dart';

extension _ServiceHelper on BaseNetwork {
  dynamic parseBody<T extends BaseModel>(dynamic responseBody, T model) {
    try {
      if (responseBody is List) {
        return responseBody
            .map((data) => model.fromJson(data))
            .cast<T>()
            .toList();
      } else if (responseBody is Map) {
        return model.fromJson(responseBody) as T;
      } else {
        return responseBody;
      }
    } catch (e) {
      print(e);
      return responseBody;
    }
  }
}
