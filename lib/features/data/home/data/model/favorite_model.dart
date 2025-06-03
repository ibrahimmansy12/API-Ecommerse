// features/home/data/model/favorite_model.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
// features/home/data/model/favorite_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteRequestModel {
  @JsonKey(name: 'product_id')
  final int? id;

  FavoriteRequestModel({this.id});

  factory FavoriteRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteRequestModelToJson(this);
}

@JsonSerializable()
class FavoriteResponseModel {
  final String message;
  final bool status;
  FavoriteResponseModel({
    required this.message,
    required this.status,
  });

  factory FavoriteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteResponseModelToJson(this);
}
