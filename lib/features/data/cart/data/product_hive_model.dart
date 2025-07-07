// features/data/cart/data/product_hive_model.dart
import 'package:hive_flutter/adapters.dart';

part 'product_hive_model.g.dart';

@HiveType(typeId: 0)
class ProductHiveModel extends HiveObject {
  ProductHiveModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.categoryId,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.productcount,
      this.isFavorites});
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? price;
  @HiveField(4)
  String? image;
  @HiveField(5)
  int? categoryId;
  @HiveField(6)
  String? createdAt;
  @HiveField(7)
  String? updatedAt;
  @HiveField(8)
  int? productcount = 0;
  @HiveField(9)
  bool? isFavorites = false;
}
