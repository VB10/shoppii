import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shoppingapp/core/service/base_model.dart';

part 'product.g.dart';

@JsonSerializable()
@immutable
final class Product extends BaseModel<Product> with EquatableMixin {
  Product({
    this.sId,
    this.image,
    this.price,
    this.title,
    this.weight,
    this.count = 0,
    this.total = 999,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }
  final String? image;
  final double? price;
  final String? title;
  @JsonKey(name: '_id')
  final String? sId;
  final int? weight;
  final int? count;
  final int? total;

  @override
  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }

  @override
  Product fromJson(Map<String, dynamic> json) => Product.fromJson(json);

  @override
  List<Object?> get props => [
        sId,
        price,
        title,
        weight,
        count,
        total,
      ];
}
