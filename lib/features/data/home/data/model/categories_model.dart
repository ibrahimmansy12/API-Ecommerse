// features/home/data/model/categories_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

// @JsonSerializable()
// class CategoriesModel {
//   bool? status;
//   String? message;
//   @JsonKey(name: 'data')
//   CategoriesData? productData;
//   CategoriesModel({
//     this.status,
//     this.message,
//     this.productData,
//   });
//   //  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

//   factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
//       _$CategoriesModelFromJson(json);
//   Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
// }

@JsonSerializable()

class CategoriesModel {
  // @JsonKey(name: 'current_page')
  // int? currentPage;
  @JsonKey(name: 'categories')
  List<CategoriesDatadetails>? categoriesDatadetails;
  CategoriesModel({
    this.categoriesDatadetails,
  });
  //  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}




/////////////////////
///
///
///
///
@JsonSerializable()
class CategoriesDatadetails {
  int? id;
  String? name;
  String? description;
  @JsonKey(name: 'img')
  String? image;
  @JsonKey(name: 'created_at')
  String? createdAt;
   @JsonKey(name: 'updated_at')
  String? updatedAt;
  // int? price;
  // @JsonKey(name: 'old_price')
  // int? oldprice;
  // int? discount;
  // String? description;
  // @JsonKey(name: 'in_favorites')
  // bool? isFavorite;
  // @JsonKey(name: 'in_cart')
  // bool? isInCart;
  // List<String>? images;
  CategoriesDatadetails({
    
    this.id,
    this.name,
    this.image,this.description,
    this.createdAt,
    this.updatedAt,
  
  });

  factory CategoriesDatadetails.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDatadetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesDatadetailsToJson(this);
}
