// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      sId: json['_id'] as String?,
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      title: json['title'] as String?,
      weight: json['weight'] as int?,
      count: json['count'] as int? ?? 0,
      total: json['total'] as int? ?? 999,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'image': instance.image,
      'price': instance.price,
      'title': instance.title,
      '_id': instance.sId,
      'weight': instance.weight,
      'count': instance.count,
      'total': instance.total,
    };
