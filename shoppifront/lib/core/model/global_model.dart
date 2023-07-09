import 'dart:convert';

import 'package:shoppifront/features/product/model/product.dart';

class GlobalModel {
  int index;
  Product? model;
  GlobalModel({
    required this.index,
    required this.model,
  });

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'model': model?.toJson(),
    };
  }

  static GlobalModel? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return GlobalModel(
      index: map['index'],
      model: Product.fromJson(map['model']),
    );
  }

  String toJson() => json.encode(toMap());

  static GlobalModel? fromJson(String source) => fromMap(json.decode(source));
}
