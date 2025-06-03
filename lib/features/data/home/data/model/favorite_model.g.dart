// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteRequestModel _$FavoriteRequestModelFromJson(
        Map<String, dynamic> json) =>
    FavoriteRequestModel(
      id: (json['product_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FavoriteRequestModelToJson(
        FavoriteRequestModel instance) =>
    <String, dynamic>{
      'product_id': instance.id,
    };

FavoriteResponseModel _$FavoriteResponseModelFromJson(
        Map<String, dynamic> json) =>
    FavoriteResponseModel(
      message: json['message'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$FavoriteResponseModelToJson(
        FavoriteResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
