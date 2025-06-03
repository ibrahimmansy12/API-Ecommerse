// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prudact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productDataDetails: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductDataDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'products': instance.productDataDetails,
    };

ProductDataDetails _$ProductDataDetailsFromJson(Map<String, dynamic> json) =>
    ProductDataDetails(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      image: json['img'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ProductDataDetailsToJson(ProductDataDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'img': instance.image,
      'category_id': instance.categoryId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
