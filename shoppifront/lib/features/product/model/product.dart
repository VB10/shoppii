import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shoppifront/core/service/base_model.dart';

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
    this.total = 999,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }
  final String? image;
  final double? price;
  final String? title;
  @JsonKey(name: '_id', ignore: true)
  final String? sId;
  final int? weight;
  final int? total;

  Product copyWith({
    int? weight,
    String? id,
    String? image,
    double? price,
    String? title,
    int? total,
  }) {
    return Product(
      weight: weight ?? this.weight,
      sId: id ?? this.sId,
      image: image ?? this.image,
      price: price ?? this.price,
      title: title ?? this.title,
      total: total ?? this.total,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }

  @override
  Product fromJson(Map<String, dynamic> json) {
    return Product.fromJson(json);
  }

  @override
  List<Object?> get props => [
        sId,
        price,
        title,
        weight,
        total,
      ];
}
