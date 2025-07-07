// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel(
      categoriesDatadetails: (json['categories'] as List<dynamic>?)
          ?.map(
              (e) => CategoriesDatadetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'categories': instance.categoriesDatadetails,
    };

CategoriesDatadetails _$CategoriesDatadetailsFromJson(
        Map<String, dynamic> json) =>
    CategoriesDatadetails(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['img'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CategoriesDatadetailsToJson(
        CategoriesDatadetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'img': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
