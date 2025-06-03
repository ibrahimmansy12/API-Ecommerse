// features/home/data/model/prudact_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'prudact_model.g.dart';

// @JsonSerializable()
// class ProductModel {
//   bool? status;
//   String? message;
//   @JsonKey(name: 'data')
//   ProductData? productData;
//   ProductModel({
//     this.status,
//     this.message,
//     this.productData,
//   });
//   //  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

//   factory ProductModel.fromJson(Map<String, dynamic> json) =>
//       _$ProductModelFromJson(json);
//   Map<String, dynamic> toJson() => _$ProductModelToJson(this);
// }

@JsonSerializable()
class ProductModel {
  // @JsonKey(name: 'current_page')
  // int? currentPage;
  @JsonKey(name: 'products')
  List<ProductDataDetails>? productDataDetails;
  ProductModel({
    this.productDataDetails,
  });
  //  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

/////////////////////
///
///
///
///
@JsonSerializable()
class ProductDataDetails {
  int? id;
  String? name;
  String? description;
  String? price;
  @JsonKey(name: 'img')
  String? image;

  @JsonKey(name: 'category_id')
  int? categoryId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  ProductDataDetails({
    this.id,
    this.name,
    this.description,
    this.price,
    this.categoryId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductDataDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDataDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataDetailsToJson(this);
}
