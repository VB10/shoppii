// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      title: json['title'] as String?,
      weight: json['weight'] as int?,
      total: json['total'] as int? ?? 999,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'image': instance.image,
      'price': instance.price,
      'title': instance.title,
      'weight': instance.weight,
      'total': instance.total,
    };
